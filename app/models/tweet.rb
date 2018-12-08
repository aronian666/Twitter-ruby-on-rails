class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :photo, styles: { medium: "1280x720", thumb: "800x600" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
