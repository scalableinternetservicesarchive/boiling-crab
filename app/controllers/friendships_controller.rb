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


		if user && user.id != current_user.id
			friendship = current_user.friendships.build(:friend_id => user.id)
			if friendship.save
				current_user.nFollowing += 1
				current_user.save
				user.nFollower += 1
				user.save
				redirect_to user_following_path(:id => current_user.id)
			else
				# can add some error handle here
				redirect_to user_following_path(:id => current_user.id)			
			end
		else
			redirect_to user_following_path(:id => current_user.id)
			
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
end
