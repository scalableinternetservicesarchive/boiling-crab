class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		redirect_to @post
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to @post
	end

	private
		def comment_params
			params[:comment][:commender_id] = current_user.id
			params.require(:comment).permit(:commender_id, :body)
		end
end
