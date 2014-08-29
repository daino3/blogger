require "rails_helper"

describe BlogPost do 

  describe "recent" do
    it "returns the most recent blog posts sorted by date" do
      FactoryGirl.create(:blog_post)
    end
  end

end