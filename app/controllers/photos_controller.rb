class PhotosController < ApplicationController
	before_action	:authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	def index
		@photos = Photo.all.order(id: "desc")
	end

	def new
		@photo = Photo.new
		@new_camera = Camera.new
		@new_lense = Lense.new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.user_id = current_user.id
		if params[:selected_button_camera] == "new_camera"
			@photo.camera_maker = params[:photo][:camera][:maker]
			@photo.camera_model = params[:photo][:camera][:model]
			Camera.create(user_id: current_user.id, maker: params[:photo][:camera][:maker], model: params[:photo][:camera][:model])
		elsif  params[:selected_button_camera] == "registered_camera"
			@camera = Camera.find(params[:photo][:camera_id])
			@photo.camera_maker = @camera.maker
			@photo.camera_model = @camera.model
      	end
      	if params[:selected_button_lense] == "new_lense"
			@photo.lense_maker = params[:photo][:lense][:maker]
			@photo.lense_model = params[:photo][:lense][:model]
			Lense.create(user_id: current_user.id, maker: params[:photo][:lense][:maker], model: params[:photo][:lense][:model])
		elsif  params[:selected_button_lense] == "registered_lense"
			@lense = Lense.find(params[:photo][:lense_id])
			@photo.lense_maker = @lense.maker
			@photo.lense_model = @lense.model
      	end
		@photo.save
		redirect_to photos_path
	end

	def show
		@photo = Photo.find(params[:id])
		@post_comment = PostComment.new
	end

	def edit
		@photo = Photo.find(params[:id])
	end
	def update
		photo = Photo.find(params[:id])
		photo.update(photo_params)
		redirect_to	photo_path(photo.id)
	end
	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to photos_path
	end
private
	def photo_params
		params.require(:photo).permit(:title, :caption, :image, :latitude, :longitude, :taken_at, :speed, :f_number, :iso_speed, :white_balance, :camera_maker, :camera_model, :lense_maker, :lense_model)
	end

end
