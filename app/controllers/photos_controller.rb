class PhotosController < ApplicationController
	def index
		@photos = current_user.photos.all.order(id: "desc")
	end

	def new
		@photo = Photo.new
		@new_camera = Camera.new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.user_id = current_user.id
		if params[:selected_button] == "new_user_camera"
			Camera.create(user_id: current_user.id, model: params[:photo][:camera_model], maker: params[:photo][:camera_maker])
		end
		if  params[:selected_button] == "another_camera"
      	@shipping_address =  ShippingAddress.find(params[:order_history][:customer_id])
        @order_history.zipcode = @shipping_address.shipping_zipcode
        @order_history.address = @shipping_address.shipping_address
        @order_history.name = @shipping_address.name

        @camera_maker = Camera.find(params[:])
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
		params.require(:photo).permit(:title, :caption, :image, :latitude, :longitude, :taken_at, :speed, :f_number, :iso_speed, :white_balance, :camera_maker, :camera_model)
	end

end
