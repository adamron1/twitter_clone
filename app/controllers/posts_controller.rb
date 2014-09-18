class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    find_post
  end

  def create
    new_post = Post.create(content: params[:content])
    @post = Post.find(new_post[:id])
    redirect_to(Post.last)
  end

  def edit
    find_post
  end

  def destroy
    find_post
    @post.destroy
    redirect_to(posts_path)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

end
