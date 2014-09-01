
class BlogPostsController < ApplicationController

  def index
    @categories = BlogCategory.all
    @posts = BlogPost.includes(:comments).all
  end

  def show
    @post = BlogPost.includes(:comments).find(params[:id])
  end

end