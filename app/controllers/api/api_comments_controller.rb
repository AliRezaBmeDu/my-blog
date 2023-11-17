module Api
  class ApiCommentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    # before_action :authenticate_user!

    def index
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:post_id])
      @comments = @post.comments
      render json: @comments
    end

    def create
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:post_id])
      @comment = @post.comments.new(comment_params.merge(author: current_user))

      if @comment.save
        render json: @comment, status: :created
      else
        render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end
