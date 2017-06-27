class Topic < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(updated_at: :desc) }

  mount_uploader :picture, PictureUploader
end
