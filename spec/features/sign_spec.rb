require 'spec_helper'


describe 'Sign in' do 
	before(:each) do
		user = FactoryGirl.create(:user)
		sign_in(user)
	end


	it 'allows to sign in' do
		page.should have_content "Erfolgreich angemeldet."
	end


	it 'allows to sign out' do
		click_link 'dummy dummy'
		page.should have_content "Erfolgreich abgemeldet."
	end
end