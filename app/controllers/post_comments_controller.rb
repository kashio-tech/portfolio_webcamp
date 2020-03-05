class PostCommentsController < ApplicationController
	before_action   :authenticate_user!
	def create
		@photo = Photo.find(params[:photo_id])
		@comment = current_user.post_comments.new(post_comment_params)
		@comment.photo_id = @photo.id
		@comment.save
	end
	def destroy
		@photo = Photo.find(params[:photo_id])
        @comment = current_user.post_comments.find(params[:id])
        @comment.destroy
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:user_id, :photo_id, :comment)
	end
end
