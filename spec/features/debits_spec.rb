require 'spec_helper'

describe 'Debits' do
	before(:each) do
	visit root_path
	@user = FactoryGirl.create(:user)
	@user1 = FactoryGirl.create(:user1)
	@user2 = FactoryGirl.create(:user2)
	@friend = FactoryGirl.create(:friend)
	@debit1 = FactoryGirl.create(:debit1)
	@debit2 = FactoryGirl.create(:debit2)
	end

it "listing" do
	sign_in(@user)
	find("#Zahlungen").click
	page.should have_content "History"
	end


it "new" do
	sign_in(@user)
	click_on "Neue Schulden eintragen"
	page.should have_content "Neuer Eintrag"
	end


it "create" do
	sign_in(@user)
	click_link 'Neue Schulden eintragen'
	fill_in "freund", with: 'Dummy'
	fill_in "email", with: 'dummy1@paymeback.de'
	fill_in "betrag", with: 20
	fill_in "info", with: 'Test1234'
	expect { click_button 'Erstellen' }.to change {Debit.count }.by(2)
	page.should have_content "Debit was successfully created."
	end


it "update" do
	sign_in(@user)
	click_link 'Bearbeiten'
	fill_in "freund", with: 'Dummy'
	fill_in "email", with: 'dummy1@paymeback.de'
	fill_in "betrag", with: '30'
	fill_in "info", with: 'UpdateTestTest1234'
	click_on 'Erstellen'
	page.should have_content "Eintragsdetails"
	end

it "destroy User=Owner" do
	sign_in(@user)
	expect {find("#loeschen").click}.to change {Debit.count }.by(-2)
	end

it "destroy User=!Owner" do
	sign_in(@user1)
	expect {find("#loeschen").click}.to change {Debit.count }.by(0)
	end
end