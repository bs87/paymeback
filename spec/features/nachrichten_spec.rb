require 'spec_helper'

describe 'nachrichten' do
	let!(:user){FactoryGirl.create(:user)}
	let!(:user1){FactoryGirl.create(:user1)}
	let!(:nachricht){FactoryGirl.create(:nachricht)}

	before(:each) do
		
		visit root_path
		sign_in (user)
		visit nachrichtens_path
	end

#	it 'test' do
#		page.should have_content 'Nachrichten'
#	end

	#it 'neue nachricht' do
	#	visit friends_path
	#	find("#freundefinden").click 
	#	first("#profilanzeigen").click 
	#	find("#nachrichtsenden").click
	#	page.should have_content 'Neue Nachricht'
	#end

	#it 'nachricht senden' do
	#	visit friends_path
	#	find("#freundefinden").click 
	#	first("#profilanzeigen").click 
	#	find("#nachrichtsenden").click
	#	fill_in "topic",with: 'huhu'
	#	fill_in "body",with: 'hey, wie gehts?'
	#	find("#senden").click
	#	page.should have_content 'Willkommen'
	#end

	it 'nachricht beantworten' do
		visit nachrichtens_path
		first("#beantworten").click
		page.should have_content 'Neue Nachricht'
	end

	it 'nachricht anzeigen' do
		visit nachrichtens_path
		first("#ansehen").click
		page.should have_content 'Nachrichten Details'
	end
end

