class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    attachment :profile_image

    has_many	:photos
    has_many	:post_comments, dependent: :destroy
    has_many	:favorites, dependent: :destroy
    has_many    :cameras, dependent: :destroy
    has_many    :lenses, dependent: :destroy

    validates  :last_name, presence: true
    validates  :first_name, presence: true
    validates  :last_name_kana, presence: true
    validates  :first_name_kana, presence: true
    validates  :display_name, presence: true

    enum status:{ 有効: 0, 無効: 1}

    def toggle_status
        if status == "有効"
            status = 1
        else
            status = 0
        end
    end
     acts_as_paranoid #paranoia
end
