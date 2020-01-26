class Photo < ApplicationRecord
	belongs_to	:user
	attachment	:image
	has_many	:post_comments, dependent: :destroy
	has_many	:favorites, dependent: :destroy
	validates	:title, presence: true
	validates	:caption, presence: true
	validates	:latitude, presence: true
	validates	:longitude, presence: true
	validates	:maker, presence: true
	validates	:camera_model,	presence: true
	validates	:camera_maker, presence: true

	def favorited_by?(user)
		if  user.present?
			favorites.where(user_id: user.id).exists?
		end
	end
end
