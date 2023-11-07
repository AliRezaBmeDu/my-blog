class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @name = @user.name
    @bio = @user.bio
  end

  private

  # Find and set the user for the 'show' action
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'User not found'
    redirect_to users_path
  end
end
