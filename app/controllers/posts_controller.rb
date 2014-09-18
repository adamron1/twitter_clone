class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    find_post
  end

  def create
    Post.create(content: params[:content])
  end

  def edit
    find_post
  end

  def destroy
    find_post
    @post.destroy
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

end
