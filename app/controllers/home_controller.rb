class HomeController < ApplicationController

  def index
    @bio = Page.find_by_name("Biography")
    @edu = Page.find_by_name("Education")
    @work = Page.find_by_name("Work Experience")

  end

end