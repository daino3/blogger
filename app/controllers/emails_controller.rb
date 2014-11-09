class EmailsController < ApplicationController


  def new
    binding.pry
    # if request.xhr?
    #   @email = Email.new
    #   render 'emails/new'
    # else
    #   flash[:warning] = "Please don't try and mess with me"
    #   redirect_to home_path
    # end
  end

  def show
    binding.pry
  end

  def send
    binding.pry
  end

end
