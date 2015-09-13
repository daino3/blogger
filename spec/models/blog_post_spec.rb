require "rails_helper"

describe BlogPost do

  describe '#index_for_search (after_save)' do
    let(:post) { FactoryGirl.build(:blog_post) }

    it 'indexes if its published' do
      expect(post).to receive(:index_document)
      post.update_attributes!(published: true)
    end

    it 'destroys it from the index if its not published' do
      expect(post).to receive(:delete_document)
      post.update_attributes!(published: false)
    end
  end

  describe "#recent" do
    def sorted(posts)
      sorted = posts.each_with_index.map do |post, index|
        post.created_at > posts[index + 1].created_at if index < posts.count - 1
      end.compact
      sorted.all? { |boolean| boolean == true }
    end

    it "returns the most recent blog posts sorted by date" do
      posts = FactoryGirl.create_list(:blog_post, 3)

      posts.each_with_index do |post, index|
        post.update_attribute(:created_at, Time.now - (index).month)
      end

      expect( sorted(BlogPost.recent) ).to be_truthy
    end
  end

end
