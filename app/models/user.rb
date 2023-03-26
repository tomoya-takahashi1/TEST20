class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :room
         has_many :reservation
         attachment :profile_image
         mount_uploader :profile_image_id, ImageUploader
         
end

