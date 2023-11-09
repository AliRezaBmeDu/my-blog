class CommentsController < ApplicationController
    def new
        @user = current_user
        @post = Post.find(params[:post_id])
    end

    def create
    end

end