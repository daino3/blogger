class HomeController < ApplicationController

  def index
    @bio = Page.find_by_name("Biography")
    @edu = Page.find_by_name("Education")
    @work = Page.find_by_name("Work Experience")
    @projects = Page.find_by_name("Projects")
    @skills = Page.find_by_name("Skills")

    posts = BlogPost.recent(6.months.ago)
    @feature_post, @other_posts = posts.shift, posts.limit(3)
  end

end