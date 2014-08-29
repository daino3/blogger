
FactoryGirl.define do
  factory :blog_post do
    sequence(:title) {|n| "title-#{n}"}
    # body LoremIpsum.generate
  end
end