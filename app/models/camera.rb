class Camera < ApplicationRecord
	belongs_to	:user

	def camera_info
		"メーカー: " + [maker].to_s + " " + "型式: " + [model].to_s
	end
end
