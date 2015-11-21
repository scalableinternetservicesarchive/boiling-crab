class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		respond_to do |format|
      format.js
    end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		respond_to do |format|
      format.js
    end
	end

	private
		def comment_params
			params[:comment][:commender_id] = current_user.id
			params.require(:comment).permit(:commender_id, :body)
		end
end
