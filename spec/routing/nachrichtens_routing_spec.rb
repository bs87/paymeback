require 'spec_helper'

describe NachrichtensController do
  describe "routing" do

    it "routes to #index" do
      get("/nachrichtens").should route_to("nachrichtens#index")
    end

    it "routes to #new" do
      get("/nachrichtens/new").should route_to("nachrichtens#new")
    end

    it "routes to #show" do
      get("/nachrichtens/1").should route_to("nachrichtens#show", :id => "1")
    end

    it "routes to #edit" do
      get("/nachrichtens/1/edit").should route_to("nachrichtens#edit", :id => "1")
    end

    it "routes to #create" do
      post("/nachrichtens").should route_to("nachrichtens#create")
    end

    it "routes to #update" do
      put("/nachrichtens/1").should route_to("nachrichtens#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/nachrichtens/1").should route_to("nachrichtens#destroy", :id => "1")
    end

  end
end



