class Api::ApiUsersController < ApplicationController
  def index
    @user = User.find(params[:api_user_id])
    @posts = @user.posts
    render json: @posts
  end
end
  