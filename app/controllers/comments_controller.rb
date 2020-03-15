class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_back(fallback_location: root_path)
		else
			redirect_back(fallback_location: root_path)
		end
	end
	def destroy
		@comment = Comment.find params[:id]
		@comment.destroy
		if @comment.save
			redirect_back(fallback_location: root_path)
		else
			redirect_back(fallback_lcoation: root_path)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end
end
