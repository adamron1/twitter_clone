class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :destroy, :show, :update]

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    new_post = Post.create(post_params)
    redirect_to(new_post)
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to(@post)
  end

  def destroy
    @post.destroy
    redirect_to(posts_url)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :content)
  end

end
