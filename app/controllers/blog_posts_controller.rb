
class BlogPostsController < ApplicationController

  def index
    @categories = BlogCategory.with_published_posts.includes(:tags)
    posts = BlogPost.published.order("published_at DESC")
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(5)
  end

  def show
    @post = BlogPost.find(params[:id])
  end

end
