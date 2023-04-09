class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :rooms
         has_many :reservations
         attachment :profile_image
         mount_uploader :profile_image_id, ImageUploader
         validates :name, presence: true
end

