class EmailsController < ApplicationController
  respond_to :json

  def create
    email_account = ActionMailer::Base.smtp_settings[:user_name]
    email = Email.new(params[:email].merge(to: email_account))

    if email.save
      BlogMailer.create(email).deliver
      render json: {message: "Thanks for your interest, maybe I'll get back to you :)"}
    else
      render json: {errors: email.errors}
    end
  end
end
