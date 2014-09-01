require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let(:blog_post) { FactoryGirl.create(:blog_post) }
  let(:tag)       { FactoryGirl.create(:tag) }

  describe "#"
  it "tags a blog post" do
    blog_post
  end
end
