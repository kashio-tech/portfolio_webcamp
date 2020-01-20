class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         attachment :profile_image

         has_many	:photos, dependent: :destroy
         has_many	:cameras, dependent: :destroy
         has_many	:lenses, dependent: :destroy
         has_many	:post_comments, dependent: :destroy
         has_many	:favorites, dependent: :destroy
         has_many :cameras, dependent: :destroy
end
