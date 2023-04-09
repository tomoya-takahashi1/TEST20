class Room < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true,numericality: true
  validates :address, presence: true
  has_many :reservations
  belongs_to :user
 
  has_one_attached :image
  mount_uploader :image, ImageUploader
 
end
