class AddPhotoUrlToTweets < ActiveRecord::Migration[5.2]
  def change
    add_attachment :tweets, :photo
  end
end
