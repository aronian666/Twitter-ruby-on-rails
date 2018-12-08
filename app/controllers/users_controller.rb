class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @tweet = Tweet.new
    @users = User.all
  end
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @tweet = Tweet.new
    @users = User.all
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :photo)
    end
end
