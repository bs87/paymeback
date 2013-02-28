require 'spec_helper'

describe 'Sign up' do 
	before(:each) do
		visit root_path
	end

	it 'allows to sign up' do
		click_link 'Registrieren'
		fill_in "email",with: 'bjoern@admin.de'
		fill_in "lastname", with: 'Bjoern'
		fill_in "lastname", with: 'Simon'
		fill_in "zip", with: '48143'
		fill_in "password", with: 'Test1234'
		fill_in "password_confirmation", with: 'Test1234'
		expect { click_button 'Registrieren' }.to change {User.count }.by(1)
		page.should have_content "Willkommen! Die Registrierung war erfolgreich."
	end
end