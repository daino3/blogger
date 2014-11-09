class Email < ActiveRecord::Base
  attr_accessible :to, :from, :subject, :body

  def self.valid_email_regex
    /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

  validates :from, format: { with: valid_email_regex }
  validates :to, format: { with: valid_email_regex }
end
