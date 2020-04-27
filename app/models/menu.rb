class Menu < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :protein, presence: true
  validates :fat, presence: true
  validates :carbohydrates, presence: true
  
  before_save :calorie_save
  
  def calorie_save
    self.calorie = protein.to_i * 4 + fat.to_i * 9 + carbohydrates.to_i * 4
  end
  
end
