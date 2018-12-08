class CommentsController < ApplicationController
  def create
    #render plain: comment_params[:message]
    @tweet = Tweet.find(params[:tweet_id])
    # puts 'Esta mamada me esta empezando a llegar'
    @user = User.find(session[:user_id])
    @comment = @tweet.comments.build(message: comment_params[:message])
    @comment = @tweet.comments.build(comment_params)
    @comment.user_id = @user.id
    #render plain: @comment
    respond_to do |format|
      if @comment.save
        format.html {redirect_back(fallback_location: root_path)}
        format.json {render :tweets, status: :created, location: @comment}
      else
        format.html {render :tweets}
        format.json { render json: @comments.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:message)
    end
end
