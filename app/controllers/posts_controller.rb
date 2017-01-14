class PostsController < ApplicationController
  include LoginHelper
  before_action :login_redirect? , only: [:edit, :destroy]
  
  def new; end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to feed_path
    else
      flash[:danger] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'Post updated!'
      redirect_to current_user
    else
      flash[:danger] = @post.errors.full_messages
      redirect_to edit_post_path
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:success] = 'Post deleted!'
    redirect_to current_user
  end

  private

  # Strong Parameters to avoid mass assignment
  def post_params
    params.require(:post).permit(:content)
  end
end
