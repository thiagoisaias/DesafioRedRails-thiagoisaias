class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:index, :show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page], :per_page => 8)
    # byebug
  end

  private

  def logged_in?
  end
end
