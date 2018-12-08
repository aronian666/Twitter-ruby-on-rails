class SessionsController < ApplicationController
  def index
    @user = User.new
  end
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
