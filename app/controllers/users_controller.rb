class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@photos = current_user.photos.all
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end


	private
	def user_params
    params.require(:user).permit(:email,:encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :display_name, :profile_image)
  	end
end
