class FriendshipsController < ApplicationController
	def index
		@friendships = Friendship.all
	end

	def show
	end

	def create
		@friendship = current_user.friendships.new(friendship_params)
		if @friendship.save
			redirect_to root_url
		else
			redirect_to root_url
	end

	private
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end
end
