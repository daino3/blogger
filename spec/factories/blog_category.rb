FactoryGirl.define do
  factory :blog_category do
    name {Faker::Lorem.word}
  end

  trait :with_blogs do
    after(:create) do |blog_cat|
      FactoryGirl.create(:blog_post, blog_category: blog_cat)
    end
  end
end
