class Topic < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(updated_at: :desc) }

  has_many :likes, dependent: :destroy
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  mount_uploader :picture, PictureUploader

end
