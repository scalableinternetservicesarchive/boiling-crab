class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @friendships = current_user.friendships.all
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
