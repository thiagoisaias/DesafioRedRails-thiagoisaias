class UsersController < ApplicationController
  include LoginHelper
  before_action :login_redirect?, only: [:index, :show]
  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page], :per_page => 8)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end
end
