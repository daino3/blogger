require 'rails_helper'

describe BlogCategory do
  describe '#with_blogs' do
    let(:cat_with_blog) { FactoryGirl.create(:blog_category, :with_published_blogs) }
    let(:cat_without_blog) { FactoryGirl.create(:blog_category) }

    it 'limits the blog categories that actually have published blog posts' do
      [cat_with_blog, cat_without_blog]

      expect(BlogCategory.with_published_posts.count).to eq(1)
      expect(BlogCategory.with_published_posts.pluck(:name)).to include(cat_with_blog.name)
    end
  end

end
