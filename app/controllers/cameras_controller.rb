class CamerasController < ApplicationController
	def index
		@cameras = current_user.cameras.all
		@camera = Camera.new
	end
	def new
		@new_camera = Camera.new
	end
	def create
		@camera = Camera.new(camera_params)
		@camera.user_id = current_user.id
		@camera.save
		redirect_to	cameras_path
	end
	def edit
		@camera = Camera.find(params[:id])
	end
	def update
		@camera = Camera.find(params[:id])
		@camera.update(camera_params)
		redirect_to cameras_path
	end
	def destroy
		@camera = Camera.find(params[:id])
		@camera.destroy
		redirect_to	cameras_path
	end

	private
  	def camera_params
    	params.require(:camera).permit(:maker, :model)
  	end
end
