class PostsController < ApplicationController
  before_action 
  # GET /posts
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
    @param = params
  end

  # GET /posts/:id
  def show
    @user = User.find(params[:user_id])
    @post_id = params[:id]
    @post = @user.posts.find(@post_id)
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  private
  def get_user
  end

  def get_post
  end
end
