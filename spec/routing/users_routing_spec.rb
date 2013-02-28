require 'spec_helper'

describe UsersController do
  describe "routing" do

    it "routes to sign_in" do
      get("/accounts/sign_in").should route_to("devise/sessions#new")
    end

    it "routes to sign_in2" do
      post("/accounts/sign_in").should route_to("devise/sessions#create")
    end

    it "routes to sign_out" do
      delete("/accounts/sign_out").should route_to("devise/sessions#destroy")
    end

    it "routes to user_password" do
      post("/accounts/password").should route_to("devise/passwords#create")
    end

    it "routes to new_user_password" do
      get("/accounts/password/new").should route_to("devise/passwords#new")
    end

    it "routes to edit_user_password" do
      get("/accounts/password/edit").should route_to("devise/passwords#edit")
    end

    it "routes to update_user_password" do
      put("/accounts/password").should route_to("devise/passwords#update")
    end

    it "routes to cancel_user_registration" do
      get("/accounts/cancel").should route_to("devise/registrations#cancel")
    end

    it "routes to user_registration" do
      post("/accounts").should route_to("devise/registrations#create")
    end

    it "routes to new_user_registration" do
      get("/accounts/sign_up").should route_to("devise/registrations#new")
    end

    it "routes to edit_user_registration" do
      get("/accounts/edit").should route_to("devise/registrations#edit")
    end

    it "routes to update_user_registration" do
      put("/accounts").should route_to("devise/registrations#update")
    end

    it "routes to delete_user_registration" do
      delete("/accounts").should route_to("devise/registrations#destroy")
    end
  end
end