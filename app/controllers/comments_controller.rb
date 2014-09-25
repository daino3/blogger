class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    saved = comment.save
    if saved
      flash[:success] = "Thanks for commenting"
    else
      flash[:failure] = "Something went wrong, Soowwwy"
    end
    render nothing: true
  end

  def edit

  end

  def show

  end

  def new
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = Comment.new
  end

  private

  def comment_params
    blog = { blog_post_id: params[:blog_post_id] }
    params[:comment].merge(blog)
  end

end