class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise  :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable

    attachment :profile_image

    has_many	:photos
    has_many	:cameras, dependent: :destroy
    has_many	:lenses, dependent: :destroy
    has_many	:post_comments, dependent: :destroy
    has_many	:favorites, dependent: :destroy

    validates   :last_name, presence: true
    validates   :first_name, presence: true
    validates   :last_name_kana, presence: true
    validates   :first_name_kana, presence: true
    validates   :display_name, presence: true
end
