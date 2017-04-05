class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Log In Successful"

      session[:user_id] = user.id

      redirect_to classrooms_path
    else
      flash.now[:danger] = "Unsuccessful login"
      render :new
    end


    def destroy
      session[:user_id] = nil
      redirect_to login_path
    end
  end




end
