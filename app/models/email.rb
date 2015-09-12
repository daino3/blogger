class Email < ActiveRecord::Base
  attr_accessible :to, :from, :subject, :body

  def self.valid_email_regex
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

  validates :to, format: { with: valid_email_regex }
  validates :from, format: { with: valid_email_regex, message: 'Your email must be valid format.'}
  validates :subject, presence: { message: 'Your subject was blank, homie.'}
  validates :body, presence: { message: 'Your message was blank, homie.'}
end
