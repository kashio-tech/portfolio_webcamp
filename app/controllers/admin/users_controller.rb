class Admin::UsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@users = User.with_deleted
	end

	def show
	  	@user = User.with_deleted.find(params[:id])
	end

	def edit
	  	@user = User.with_deleted.find(params[:id])
	end

	def update
	  	user = User.with_deleted.find(params[:id])
	  	user.update(user_params)
	  	redirect_to admin_user_path(user.id)
	end

	def toggle_status
		@user = User.with_deleted.find(params[:user_id])
		@user.update(status: @user.toggle_status)
		if @user.status == "有効"
			@user.restore
		else
			@user.destroy
		end
		redirect_to edit_admin_user_path(@user.id)
	end

	private
	def user_params
	  	params.require(:user).permit(:email,:encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :display_name, :profile_image)
	end
end
