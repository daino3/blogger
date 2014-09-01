class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @categories = BlogCategory.all
    @posts = @tag.blog_posts
    render "blog_posts/index"
  end

end