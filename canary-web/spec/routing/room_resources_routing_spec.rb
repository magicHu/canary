require "spec_helper"

describe RoomResourcesController do
  describe "routing" do

    it "routes to #index" do
      get("/room_resources").should route_to("room_resources#index")
    end

    it "routes to #new" do
      get("/room_resources/new").should route_to("room_resources#new")
    end

    it "routes to #show" do
      get("/room_resources/1").should route_to("room_resources#show", :id => "1")
    end

    it "routes to #edit" do
      get("/room_resources/1/edit").should route_to("room_resources#edit", :id => "1")
    end

    it "routes to #create" do
      post("/room_resources").should route_to("room_resources#create")
    end

    it "routes to #update" do
      put("/room_resources/1").should route_to("room_resources#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/room_resources/1").should route_to("room_resources#destroy", :id => "1")
    end

  end
end
