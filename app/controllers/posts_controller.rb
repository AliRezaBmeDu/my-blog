class PostsController < ApplicationController
  # GET /posts
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  # GET /posts/:id
  def show
    @user = User.find(params[:user_id])
    @post_id = params[:format]
    @post = @user.posts.find(@post_id)
  end
end
