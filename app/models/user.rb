class User < ApplicationRecord
  has_secure_password
  has_many :tweets, dependent: :destroy
  has_many :follows

  has_attached_file :photo, styles: { medium: "1280x720", thumb: "800x600" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
