class UserFile < ActiveRecord::Base
  mount_uploader :file, FileUploader
  belongs_to :user

  validates :file, presence: true
end
