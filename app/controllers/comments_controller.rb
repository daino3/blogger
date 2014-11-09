class CommentsController < ApplicationController

  def create
    @post = BlogPost.find(params[:blog_post_id])
    comment = Comment.new(comment_params)

    if comment.save
      flash[:success] = "Thanks for commenting"
    else
      flash[:failure] = comment.errors.messages
    end
    redirect_to blog_post_path(@post)
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