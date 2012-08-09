class HomeController < ApplicationController
  def index
    @banners = Banner.all_public
  end
end
