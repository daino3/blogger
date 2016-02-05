class EmailsController < ApplicationController
  respond_to :json

  def create
    if sent_from_bot?
      render json: {message: "please stop spamming me"}, status: 400
      return
    end

    email_account = ActionMailer::Base.smtp_settings[:user_name]
    email = Email.new(params[:email].merge(to: email_account))

    if email.save
      BlogMailer.create(email).deliver
      render json: {message: "Thanks for your interest, maybe I'll get back to you :)"}
    else
      render json: {errors: email.errors}
    end
  end

  private

  def sent_from_bot?
    bot_checked = params[:email].delete(:bot_box)
    bot_checked.to_i == 1
  end
end
