require 'spec_helper'


describe 'Sign in' do 
	before(:each) do
		user = FactoryGirl.create(:user)
		sign_in(user)
	end

it "Listing Debits" do
	find("#Zahlungen").click
		page.should have_content "History"
	end
end