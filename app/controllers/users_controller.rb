class UsersController < ApplicationController
  before_action :require_user, only: [:show, :index, :feed]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @posts = @user.posts.where(sell_to: -1).order(created_at: :desc)
    @posts = @user.posts.where(sell_to: -1)
      .paginate(:page => params[:page], :per_page => 10).order(id: :desc)
  end

  def selling
    @user = User.find(params[:id])
    # @posts = @user.posts.where(sell_to: -1).order(created_at: :desc)
    @posts = @user.posts.where(sell_to: -1)
      .paginate(:page => params[:page], :per_page => 10).order(id: :desc)
    respond_to do |format|
      format.js
    end
  end

  def sold
    @user = User.find(params[:id])
    @posts = @user.posts.where.not(sell_to: -1).order(created_at: :desc)
    respond_to do |format|
      format.js
    end
  end

  def following
    @user = User.find(params[:id])
    following_id = @user.friendships.all.pluck(:friend_id)
    @following = User.where(id: following_id)
    # @following = User.where(id: following_id).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.js
    end

  end

  def follower
    @user = User.find(params[:id])
    follower_id = Friendship.where(friend_id: @user.id).pluck(:user_id)
    @followers = User.where(id: follower_id)
    #  @followers = User.where(id: follower_id).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.js
    end
  end

  def feed
    feed_users_ids = current_user.friends.pluck(:id)
    # @feed_posts = Post.where(user_id: feed_users_ids, sell_to: -1).order(updated_at: :desc)
    @feed_posts = Post.where(user_id: feed_users_ids, sell_to: -1)
         .paginate(:page => params[:page], :per_page => 10).order(id: :desc)
    @user = current_user
    @comment = Comment.new
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
        redirect_to error_path
      end
  end

  def error

  end

  private
    def user_params
      params[:user][:nFollowing] = 0
      params[:user][:nFollower] = 0
      params[:user][:nPost] = 0
      params[:user][:nSold] = 0
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
        :image, :nFollowing, :nFollower, :nPost, :nSold)
    end
end
