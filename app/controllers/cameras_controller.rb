class CamerasController < ApplicationController
	before_action	:authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
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
		if @camera.save
			redirect_to	cameras_path
		else
			render "/photos/new.html.erb"
		end
	end
	def edit
		@camera = Camera.find(params[:id])
		if @camera.user != current_user
			redirect_to root_path
		end
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
