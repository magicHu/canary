class HomeController < ApplicationController
  def index
    @banners = Banner.all
  end
end
