class PostsController < ApplicationController
  before_action :get_user_post, only: [:show]
  # GET /posts
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
    @param = params
  end

  # GET /posts/:id
  def show
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
      
  end

  private

  def get_user_post
    @user = User.find(params[:user_id])
    @post_id = params[:id]
    @post = @user.posts.find(@post_id)
  end

end
