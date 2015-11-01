class UsersController < ApplicationController
  before_action :require_user, only: [:show, :index, :feed]

  def index
    @users = User.all
  end

  def show
    @posts = current_user.posts.all
    @friendships = current_user.friendships.all
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
