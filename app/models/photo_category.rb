class PhotoCategory < ApplicationRecord
	belongs_to :photos
	belongs_to :categories
end
