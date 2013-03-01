require 'spec_helper'


describe 'Sign in' do 
	before(:each) do
		user = FactoryGirl.create(:user)
		sign_in(user)
	end

it "Auf Freunde klicken um die Freundeseite zu sehen" do
	find("#freundebutton").click 
		page.should have_content "Deine Freunde"
	end

it "Auf Freunde finden um Freunde hinzuzufuegen" do
	find("#freundebutton").click 
	User.create email: "test@paymeback.de", firstname: "Testuser",firstname: "Testuser"
	User.create email: "test2@paymeback.de", firstname: "Testuser2",firstname: "Testuser2"
	find("#freundefinden").click 
	page.should have_content "Als Freund"
	end

it "Auf Freunde Hinzufuegen Freund eine anfrage zu stellen" do
	User.create email: "test@paymeback.de", firstname: "Testuser",firstname: "Testuser"
	User.create email: "test2@paymeback.de", firstname: "Testuser2",firstname: "Testuser2"
	find("#freundebutton").click 
	find("#freundefinden").click 
	first("#freundehinzufuegen").click 
	page.should have_content "Deine Freunde"
	end

it "Freundschaftsanfrage wieder stonieren" do
	User.create email: "test@paymeback.de", firstname: "Testuser",firstname: "Testuser"
	User.create email: "test2@paymeback.de", firstname: "Testuser2",firstname: "Testuser2"
	find("#freundebutton").click 
	find("#freundefinden").click 
	first("#freundehinzufuegen").click 
	click_on("Anfrage stornieren")
	page.should have_content "Freundschaft beendet."
	end

	it "Freundschaft beenden" do
	User.create email: "test@paymeback.de", firstname: "Testuser",firstname: "Testuser"
	Friend.create user_id: user.id, friend_id: 2, accepted: true 	
	find("#freundebutton").click 
	find("#freundefinden").click 
	first("#freundehinzufuegen").click 
	click_on("Freundschaft beenden")
	page.should have_content "Freundschaft beendet."
	end


end

