class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @categories = BlogCategory.with_published_posts.includes(:tags)
    posts = @tag.blog_posts

    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(5)

    render "blog_posts/index"
  end

end
