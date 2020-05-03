class Menu < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :protein, presence: true
  validates :fat, presence: true
  validates :carbohydrates, presence: true
  
  mount_uploader :img, ImgUploader
  
  before_save :calorie_save
  def calorie_save
    self.calorie = protein.to_i * 4 + fat.to_i * 9 + carbohydrates.to_i * 4
  end
  
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  
  def favorite(user)
    self.favorites.find_or_create_by(user_id: user.id)
  end
  
  def unfavorite(user)
    favorite = self.favorites.find_by(user_id: user.id)
    favorite.destroy if favorite
  end
  
  def favorite?(user)
    self.favorites.exists? user_id: user.id
  end
  
end
