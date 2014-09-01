FactoryGirl.define do
  factory :tag, class: 'Tag' do
    name Faker::Team.creature
    association :blog_category
  end
end