
class BlogPostsController < ApplicationController

  def index
    @categories = BlogCategory.all
    posts = BlogPost.includes(:comments).all
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(5)
  end

  def show
    @post = BlogPost.includes(:comments).find(params[:id])
    @comments = Kaminari.paginate_array(@post.comments).page(params[:page]).per(5)
  end

end