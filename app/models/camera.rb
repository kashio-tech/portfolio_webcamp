class Camera < ApplicationRecord
	belongs_to	:user

	def camera_info
		"メーカー: " + maker + " " + "型式: " + model
	end
end
