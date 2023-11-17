class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :find_user_post, only: [:show]
  # GET /posts
  def index
    @user = User.includes(posts: :comments).find(params[:id])
    @posts = @user.posts
    @param = params
  end

  # GET /posts/:id
  def show; end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    @par = post_params

    if @post.save
      redirect_to user_post_path(user_id: @user.id, id: @post.id), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @post = Post.includes(:likes).find(params[:id])
    @author = @post.author
    @author.decrement!(:posts_counter)
    @post.likes.destroy_all
    @post.destroy!

    redirect_to user_posts_path(id: @author.id), notice: 'Post successfully deleted'
  end

  private

  def find_user_post
    @user = User.includes(posts: :comments).find(params[:user_id])
    @post_id = params[:id]
    @post = @user.posts.find(@post_id)
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
