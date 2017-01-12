class PostsController < ApplicationController
  
  def new; end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to current_user
    else
      flash[:danger] = 'Something wrong happened'
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = 'Post deleted!'
    redirect_to current_user
  end

  # Strong Parameters to avoid mass assignment
  private

  def post_params
    params.require(:post).permit(:content)
  end
end
