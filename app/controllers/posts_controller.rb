class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  # GET /posts
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  # GET /posts/:id
  def show
    @user = User.find(params[:user_id])
  end

  private

  def set_post
    @post = @user.posts.find(params[:id])
  end
end
