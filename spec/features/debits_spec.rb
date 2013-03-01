require 'spec_helper'

describe 'Debits' do
	before(:each) do
	visit root_path
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


it "Click link Neuer Eintrag" do
	click_on "Neue Schulden eintragen"
	page.should have_content "Neuer Eintrag"
	end


it "Create Debits - Formular" do
	click_link 'Neue Schulden eintragen'
	fill_in "freund", with: 'Dummy'	
	fill_in "art", with: 'Geliehen'
	fill_in "betrag", with: '20'
	fill_in "info", with: 'Test1234'
	expect { click_button 'Erstellen' }.to change {Debit.count }.by(2)
	page.should have_content "Debit was successfully created."
	end


it "Update Debits - Formular" do
	click_link 'Bearbeiten'
	fill_in "freund", with: 'Dummy'
	fill_in "art", with: 'Verliehen'
	fill_in "betrag", with: '30'
	fill_in "info", with: 'UpdateTestTest1234'
	expect { click_button 'Erstellen' }.to change {Debit.count }.by(2)
	page.should have_content "Eintrag wurde erfolgreich erstellt"
	end


end