
FactoryGirl.define do
  factory :blog_post do
    sequence(:title) {|n| "title-#{n}"}
    association :blog_category
    summary Faker::Lorem.paragraph(4)
    body Faker::Lorem.paragraphs(3)
  end
end