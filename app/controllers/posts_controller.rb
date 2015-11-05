class PostsController < ApplicationController
	
	before_action :require_user, only: [:index]

	def index
		@posts = current_user.posts.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@user = current_user
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = current_user.posts.new(post_params)

		if @post.save
			current_user.update({nPost: current_user.nPost + 1})
			redirect_to root_url
  	else
  		render :new
  	end
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to posts_path
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :description, :price, :image)
		end
end
