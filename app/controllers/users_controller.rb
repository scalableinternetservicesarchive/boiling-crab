class UsersController < ApplicationController
  before_action :require_user, only: [:show, :index, :feed]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @friendships = @user.friendships.all
  end

  def following
    @user = User.find(params[:id])
    following_id = @user.friendships.all.pluck(:friend_id)
    @following = User.where(id: following_id)
    render locals: {
      error: ""
    }
  end

  def follower
    @user = User.find(params[:id])
    follower_id = Friendship.where(friend_id: @user.id).pluck(:user_id)
    @followers = User.where(id: follower_id)
  end

  def feed
    feed_users_ids = current_user.friends.pluck(:id) << current_user.id
    @feed_posts = Post.where(user_id: feed_users_ids).order(updated_at: :desc)
  end

  def new
      @user = User.new
  end

  def create 
      @user = User.new(user_params) 

      if @user.save 
        session[:user_id] = @user.id 
        redirect_to '/' 
      else 
        render :action => 'new'
      end 
  end

  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
