class SearchController < ApplicationController

  def find
    text = params[:search][:text]
    tag_results = Tag.search(text).records.to_a

    @categories = BlogCategory.all
    @posts = BlogPost.search(text).records.to_a | tag_results.map(&:blog_posts).flatten
    render "blog_posts/index"
  end

end