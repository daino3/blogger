class HomeController < ApplicationController

  def index
    @bio = Page.find_by_name("Biography")
    @edu = Page.find_by_name("Education")

  end

end