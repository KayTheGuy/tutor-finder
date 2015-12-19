class PostsController < ApplicationController
	skip_before_action :require_login, :only => [:index]
	#before_action :authenticate_user!, except: [:index, :show]

	def index
        
		@posts = Post.all.order('created_at DESC')
        x = session[:user_id]
        if session[:user_id] != nil
        @current_user = User.find(x)
        end
	end

	def new
		@current_user = User.find(session[:user_id])
		@post = Post.new

	end

	def show
		@post = Post.where( :id => params[:id]).first
        @current_user = User.find(session[:user_id])
        @comment = Comment.new
	end

	def create
		@current_user = User.find(session[:user_id])
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	 @current_user = User.find(session[:user_id])
		@post = Post.find(params[:id])
	end

	def update
		 @current_user = User.find(session[:user_id])

		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body, :photo))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :user_id, :photo)

	end

end
