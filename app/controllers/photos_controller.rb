class PhotosController < ApplicationController
	before_action	:authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	def index
		#@photos = Photo.all.order(id: "desc")
	end

	def new
		@photo = Photo.new
		@new_camera = Camera.new
		@new_lense = Lense.new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.user_id = current_user.id
  		case params[:selected_button_camera]
			when "new_camera"	#params[:name値]　== value値
				if params[:photo][:camera][:maker] !="" && params[:photo][:camera][:model] != ""
					@photo.camera_maker = params[:photo][:camera][:maker]
					@photo.camera_model = params[:photo][:camera][:model]
					Camera.create(user_id: current_user.id, maker: params[:photo][:camera][:maker], model: params[:photo][:camera][:model])
				end
			when "registered_camera"
				if params[:photo][:camera_id] != ""
					@camera = Camera.find(params[:photo][:camera_id])
					@photo.camera_maker = @camera.maker
					@photo.camera_model = @camera.model
				end
      	end

      	case params[:selected_button_lense]
      		when "new_lense"	#params[:name値]　== value値
      			if params[:photo][:lense][:maker] != "" && params[:photo][:lense][:model] != ""
					@photo.lense_maker = params[:photo][:lense][:maker]
					@photo.lense_model = params[:photo][:lense][:model]
					Lense.create(user_id: current_user.id, maker: params[:photo][:lense][:maker], model: params[:photo][:lense][:model])
				end
			when "registered_lense"
				if params[:photo][:lense_id] != ""
					@lense = Lense.find(params[:photo][:lense_id])
					@photo.lense_maker = @lense.maker
					@photo.lense_model = @lense.model
				end
      	end

		if @photo.save
			redirect_to photos_path
		else
			@new_camera = Camera.new
			@new_lense = Lense.new
			render :new
		end
	end

	def show
		@photo = Photo.find(params[:id])
		@post_comment = PostComment.new
		@search = Photo.ransack(params[:q])
		@photos = @search.result(distinct: true).order(id: "desc")
	end

	def edit
		@photo = Photo.find(params[:id])
		if @photo.user != current_user
			redirect_to root_path
		end
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
