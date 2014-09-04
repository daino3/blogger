# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# categories = BlogCategory.all

# 3.times do
#   blog_category = categories.sample
#   title = Faker::Name.title
#   body = Faker::Lorem.paragraphs(3)
#   post = BlogPost.create!(title: title, body: body, blog_category_id: blog_category.id)
#   3.times do
#     name = Faker::Team.creature
#     tag = Tag.create!(name: name, blog_category_id: blog_category.id)
#     post.tags << tag
#   end
# end