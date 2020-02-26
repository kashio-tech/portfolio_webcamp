class FavoritesController < ApplicationController
    before_action   :authenticate_user!
	def create
        @photo = Photo.find(params[:photo_id])
        if @photo.user_id != current_user.id
            favorite = current_user.favorites.new(photo_id: @photo.id)
            favorite.save
        end
    end
    def destroy
        @photo = Photo.find(params[:photo_id])
        if @photo.user_id != current_user.id
            favorite = current_user.favorites.find_by(photo_id: @photo.id)
            favorite.destroy
        end
    end

    # private
    # def redirect
    #     case params[:redirect_id].to_i
    #     when 0
    #         redirect_to photos_path
    #     when 1
    #         redirect_to photo_path(@photo.id)
    #     end
    # end
end