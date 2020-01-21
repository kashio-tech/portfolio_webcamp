class FavoritesController < ApplicationController
    before_action   :authenticate_user!
	def create
        photo = Photo.find(params[:photo_id])
        if photo.user_id != current_user.id
            favorite = current_user.favorites.new(photo_id: photo.id)
            favorite.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end
    def destroy
        photo = Photo.find(params[:photo_id])
        if photo.user_id != current_user.id
            favorite = current_user.favorites.find_by(photo_id: photo.id)
            favorite.destroy
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end
end