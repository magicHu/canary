class HomeController < ApplicationController
  def index
    @banners = Banner.all_onshelf
  end
end
