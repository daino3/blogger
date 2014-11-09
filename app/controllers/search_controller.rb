class SearchController < ApplicationController

  def find
    text = params[:search][:text]
    tag_results = Tag.search(text)
    @categories = BlogCategory.all
    posts = BlogPost.search(text) | tag_results.map(&:blog_posts).flatten

    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(5)
    render "blog_posts/index"
  end

end