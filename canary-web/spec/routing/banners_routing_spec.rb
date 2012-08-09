require "spec_helper"

describe BannersController do
  describe "routing" do

    it "routes to #index" do
      get("/banners").should route_to("banners#index")
    end

    it "routes to #new" do
      get("/banners/new").should route_to("banners#new")
    end

    it "routes to #show" do
      get("/banners/1").should route_to("banners#show", :id => "1")
    end

    it "routes to #edit" do
      get("/banners/1/edit").should route_to("banners#edit", :id => "1")
    end

    it "routes to #create" do
      post("/banners").should route_to("banners#create")
    end

    it "routes to #update" do
      put("/banners/1").should route_to("banners#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/banners/1").should route_to("banners#destroy", :id => "1")
    end

  end
end
