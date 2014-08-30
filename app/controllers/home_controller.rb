class HomeController < ApplicationController

  def index
    pages = Page.all
    @bio = select(pages, "Biography")
    @edu = select(pages, "Education")
    @work = select(pages, "Work Experience")
    @projects = select(pages, "Projects")
    @skills = select(pages, "Skills")
    posts = BlogPost.recent(6.months.ago).limit(5)

    @featured_post = posts.shift
    @other_posts = posts
  end

  private 

  def select(selection, page_name)
    selection.find { |page| page.name == page_name }
  end

end