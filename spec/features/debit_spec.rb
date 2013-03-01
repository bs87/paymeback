require 'spec_helper'


describe 'Sign in' do
	before(:each) do
	@user = FactoryGirl.create(:user)
	@user1 = FactoryGirl.create(:user1)
	@user2 = FactoryGirl.create(:user2)
	@friend = FactoryGirl.create(:friend)
	sign_in(@user)
end

it "Listing Debits" do
	find("#Zahlungen").click
		page.should have_content "History"
	end
end