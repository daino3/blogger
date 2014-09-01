class SearchController < ApplicationController

  def find
    text = params[:search][:text]
    tag_results = Tag.search(text).records.to_a
    posts_results = BlogPost.search(text).records.to_a
    binding.pry
  end

end