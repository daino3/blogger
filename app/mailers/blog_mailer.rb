class BlogMailer < ActionMailer::Base
  default from: "dainovu3@gmail.com"

  def format_and_send(email)
    @email = email
    mail(to: "#{email.to} <#{email.to}>", subject: email.subject).deliver
  end

end
