class AuthenticationController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You are now signed out!'
  end

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Welcome, you are now signed in!'
    else
      flash[:notice] = 'Uh Oh, something went wrong'
      render :new
    end
  end
end
