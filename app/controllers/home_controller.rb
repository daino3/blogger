class HomeController < ApplicationController

  def index
    pages = Page.all
    @bio      = select(pages, "Biography")
    @edu      = select(pages, "Education")
    @work     = select(pages, "Work Experience")
    @projects = select(pages, "Projects")
    @skills   = select(pages, "Skills")

    # implement this
    # @content_areas = [bio, edu, work, projects, skills]

    posts = BlogPost.recent(6.months.ago).limit(5)

    @image = Photo.find_by_title("skyline")

    @featured_post = posts.shift
    @other_posts = posts
  end

  private

  def select(selection, page_name)
    selection.find { |page| page.name == page_name }
  end

end