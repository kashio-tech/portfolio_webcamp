class UsersController < ApplicationController
	before_action	:authenticate_user!, only: [:edit, :update]
	before_action	:search
	def show
		@user = User.find(params[:id])
		@photos = @user.photos.all.order(id: "desc")
	end
	def show_map
		@user = User.find(params[:id])
		@photos = @user.photos.all.order(id: "desc")
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		user.status == "無効"
		user.save
		redirect_to root_path
	end


	private
	def user_params
    params.require(:user).permit(:email,:encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :display_name, :profile_image)
  	end
end
