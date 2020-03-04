class Admin::PhotosController < ApplicationController
before_action :authenticate_admin!
  def index
  	#@user = User.with_deleted.find(params[:id])
    @user = User.with_deleted
  	@photos = Photo.all.order(id: "desc")
  end

  def show
    @photo = Photo.find(params[:id])
    if @photo.user.nil?
      flash[:notice] = "ユーザーが削除されているため、詳細は確認できません"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end
  def update
    photo = Photo.find(params[:id])
    if  photo.update(photo_params)
        redirect_to admin_photo_path(photo.id)
    else
        redirect_to admin_photos_path
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to photos_path
  end

  private
	def photo_params
		params.require(:photo).permit(:title, :caption, :image, :latitude, :longitude, :taken_at, :speed, :f_number, :iso_speed, :white_balance, :camera_maker, :camera_model, :lense_maker, :lense_model)
	end
end
