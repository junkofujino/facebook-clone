class Topic < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(updated_at: :desc) }
end
