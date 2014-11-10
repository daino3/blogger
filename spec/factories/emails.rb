# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email do
    from 'sender@gmail.com'
    to 'recipient@gmail.com'
    subject 'A Great Subject'
    body 'You are the man'

  end
end
