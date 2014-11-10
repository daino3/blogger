class EmailsController < ApplicationController

  def new
    @email = Email.new
    render layout: false
  end

  def send_email
    BlogMailer
    email_account = ActionMailer::Base.smtp_settings[:]
    email = Email.new(params[:email].merge(to: email_account))
    if email.save!
      BlogMailer.format_and_send(email)
      flash[:success] = "Thanks for your interest, maybe I'll get back to you"
    else
      flash[:failure] = "Something was up with you email, can you retry?"
    end
    render nothing: true
  end

end
