class SessionsController < ApplicationController
  def new
    @login_errors = Array.new
  end


  def create
    flag = true
    @login_errors = Array.new
    if params[:session][:email] == ""
      @login_errors.push("email can't be none!")
      flag = false
    end

    if params[:session][:password] == ""
      @login_errors.push("password can't be none")
      flag = false
    end

    if flag == false
      render :action => 'new'
      return 
    end


    @user = User.find_by_email(params[:session][:email])

    if @user == nil
      @login_errors.push("User doesn't exist")
      render :action => 'new'
      return 
    end

    if @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # redirect_to '/login'
      @login_errors.push("password is not correct")
      render :action => 'new'
    end 
  end

  def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
  end
end
