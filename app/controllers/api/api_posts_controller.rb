module Api
  class ApiPostsController < ApplicationController
    before_action :authenticate_user!

    def index
      @user = current_user
      @posts = @user.posts
      render json: @posts
    end
  end
end
