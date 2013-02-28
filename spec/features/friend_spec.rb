require 'spec_helper'


describe 'Sign in' do 
	before(:each) do
		user = FactoryGirl.create(:user)
		sign_in(user)
	end

it "Auf Freunde klicken um die Freundeseite zu sehen" do
	click_on 'Freunde'
		page.should have_content "Deine Freunde"
	end

it "Auf Freunde finden um Freunde hinzuzufuegen" do
	click_on 'Freunde finden'
		page.should have_content "Als Freund"
	end

it "Auf Freunde Hinzufuegen Freund eine anfrage zu stellen" do
	click_on 'Als Freund hinzufuegen'
		page.should have_content "Vorname"
	end

	it "Auf Freunde Hinzufuegen Freund eine anfrage zu stellen" do
	click_on 'Als Freund'
		page.should have_content "Freund hinzugefuegt."
	end
end