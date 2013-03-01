require 'spec_helper.rb'



describe 'Freundschaften:' do
	before(:each) do
		user = FactoryGirl.create(:user)
		user1 = FactoryGirl.create(:user1)
		user2 = FactoryGirl.create(:user2)
		user3 = FactoryGirl.create(:user3)
		friend = FactoryGirl.create(:friend)
		friendanfrage = FactoryGirl.create(:friendanfrage)	
		sign_in(user)
	end



it "Auf Freunde klicken um die Freundeseite zu sehen" do
	find("#freundebutton").click 
		page.should have_content "Deine Freunde"
	end

it "Auf Freunde finden um Freunde hinzuzufuegen" do
	find("#freundebutton").click 
	find("#freundefinden").click 
	page.should have_content "Als Freund"
	end

it "Auf Freunde Hinzufuegen Freund eine anfrage zu stellen" do
	find("#freundebutton").click 
	find("#freundefinden").click 
	first("#freundehinzufuegen").click 
	page.should have_content "Deine Freunde"
	end

it "Freundschaftsanfrage wieder stonieren" do
	find("#freundebutton").click 
	find("#freundefinden").click 
	first("#freundehinzufuegen").click 
	click_on("Anfrage stornieren")
	page.should have_content "Freundschaft beendet."
	end


it "Freundschaftsanfrage annehmen" do
	find("#freundebutton").click 
	find("#freundefinden").click 
	first("#freundehinzufuegen").click 
	first("#freundannehmen").click
	page.should have_content "Anfrage erfolgreich angenommen."
	end


it "Nachricht an Freund senden" do
	find("#freundebutton").click 
	first("#nachrichtsenden").click
	page.should have_content "Neue Nachricht"
	end

end

