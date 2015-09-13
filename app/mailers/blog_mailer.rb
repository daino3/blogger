class BlogMailer < ActionMailer::Base
  default from: "dainovu3@gmail.com"

  def create(email)
    @email = email
    mail(to: @email.to, from: @email.from, subject: @email.subject, body: @email.body)
  end

end
