# app/controllers/api/api_comments_controller.rb
module Api
    class ApiCommentsController < ApplicationController
      before_action :authenticate_user!

      def index
        @post = current_user.posts.find(params[:post_id])
        @comments = @post.comments
        render json: @comments
      end
      
      def create
        @post = current_user.posts.find(params[:post_id])
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
  