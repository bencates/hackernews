require "spec_helper"

describe StoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/").should route_to("stories#index")
    end

    it "routes to #new" do
      get("/new").should route_to("stories#new")
    end

    it "routes to #show" do
      get("/1").should route_to("stories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/1/edit").should route_to("stories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/").should route_to("stories#create")
    end

    it "routes to #update" do
      put("/1").should route_to("stories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/1").should route_to("stories#destroy", :id => "1")
    end

    it "routes to #upvote" do
      post("/1/upvote").should route_to("stories#upvote", id: '1')
    end

  end
end
