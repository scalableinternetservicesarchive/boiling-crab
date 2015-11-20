class FriendshipsController < ApplicationController
	def index
		@friendships = Friendship.all
	end

	def new
		@friendship = Friendship.new
	end

	def create
		name_parts = params[:friend_name].split(' ')
		user = User.find_by(first_name: name_parts[0], last_name: name_parts[1])


		if user && user.id != current_user.id && current_user.friendships.find_by(friend_id: user.id).nil?
			friendship = current_user.friendships.build(:friend_id => user.id)
			if friendship.save
				current_user.nFollowing += 1
				current_user.save
				user.nFollower += 1
				user.save
			else
				# can add some error handle here
			end
		else
			#can add some error handlers here
		end

		@user = User.find(current_user.id)
    following_id = @user.friendships.all.pluck(:friend_id)
    @following = User.where(id: following_id)
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@friendship = current_user.friendships.find_by(friend_id: params[:id])

		@friendship.destroy

		current_user.nFollowing -= 1
		current_user.save
		friend = User.find(params[:id])
		friend.nFollower -= 1
		friend.save

		redirect_to user_following_path(id: current_user.id)
	end

	private
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
      params[:friendship][:user_id] = current_user.id
      return params
    end

		def ajax_redirect_to(redirect_uri)
    	{ js: "window.location.replace('#{redirect_uri}');" }
  	end
end
