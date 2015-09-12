class EmailsController < ApplicationController

  def send_email
    email_account = ActionMailer::Base.smtp_settings[:user_name]
    email = Email.new(params[:email].merge(to: email_account))
    if email.save!
      BlogMailer.format_and_send(email)
      flash[:success] = "Thanks for your interest, maybe I'll get back to you :)"
    else
      flash[:failure] = "Something was up with you email, can you retry?"
    end
    render nothing: true
  end

end
