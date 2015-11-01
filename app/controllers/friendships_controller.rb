class FriendshipsController < ApplicationController
	def index
		@friendships = Friendship.all
	end

	def new
		@friendship = Friendship.new
	end

	def create
		unless User.exists?(params[:friend_id])
			render 'new'
			return
		end

		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			redirect_to user_path(current_user)
		else
			render 'new'
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
		@friendship.destroy
		redirect_to user_path(current_user)
	end

	private
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
      params[:friendship][:user_id] = current_user.id
      return params
    end
end
