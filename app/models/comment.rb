class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end
