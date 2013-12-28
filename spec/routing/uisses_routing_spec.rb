require "spec_helper"

describe UissesController do
  describe "routing" do

    it "routes to #index" do
      get("/uisses").should route_to("uisses#index")
    end

    it "routes to #new" do
      get("/uisses/new").should route_to("uisses#new")
    end

    it "routes to #show" do
      get("/uisses/1").should route_to("uisses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/uisses/1/edit").should route_to("uisses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/uisses").should route_to("uisses#create")
    end

    it "routes to #update" do
      put("/uisses/1").should route_to("uisses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/uisses/1").should route_to("uisses#destroy", :id => "1")
    end

  end
end
