class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.user_id = current_user.id
		@photo.save
		redirect_to photos_path
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def edit
		@photo = Photo.find(params[:id])
	end
	def update
		photo = Photo.find(params[:id])
		photo.update(photo_params)
		redirect_to	photo_path(photo.id)
	end
private
	def photo_params
		params.require(:photo).permit(:title, :caption, :image, :latitude, :longitude, :taken_at, :speed, :f_number, :iso_speed, :white_balance)
	end

end
