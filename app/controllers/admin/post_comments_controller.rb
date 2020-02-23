class Admin::PostCommentsController < ApplicationController
	before_action :authenticate_admin!
	def destroy
    	comment = PostComment.find(params[:id])
        comment.destroy
        redirect_back(fallback_location: root_path)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:user_id, :photo_id, :comment)
	end
end
