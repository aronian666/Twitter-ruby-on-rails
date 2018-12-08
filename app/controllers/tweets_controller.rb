class TweetsController < ApplicationController
  def index
    if current_user
      @user = User.find(session[:user_id])
      @tweets = Tweet.all
      @tweet = Tweet.new
      @users = User.all
    end
  end

  def create
    @user = User.find(session[:user_id])
    @tweet = Tweet.new(tweet_params)
    @tweet.likes = 0
    @tweet.user_id = @user.id
    @tweet.retweet = 0
    respond_to do |format|
      if @tweet.save
        format.html {redirect_back(fallback_location: root_path)}
        format.json {render :tweets, status: :created, location: @tweet}
      else
        format.html {render :tweets}
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end
  def new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @newtweet = Tweet.new
    @user = User.find(session[:user_id])
    @users = User.all
  end
  def edit
  end

  private
    def tweet_params
      params.require(:tweet).permit(:message, :photo)
    end
end
