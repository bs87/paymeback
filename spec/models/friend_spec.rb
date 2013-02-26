require 'spec_helper.rb'

describe Friend do
	it "anlegen ohne Attribute"do
		f = Friend.create
		f.should_not be_valid
	end
	it "anlegen mit friend_id" do 
		f = Friend.create :friend_id =>"1"
		f.should_not be_valid
	end

	it "anlegen mit user_id" do
		f = Friend.create :user_id => "1"
		f.should_not be_valid
	end

	it "anlegen mit user_id = friend_id" do
		f = Friend.create :friend_id =>"1", :user_id => "1"
		f.should_not be_valid
	end

	it "richtiges anlegen testen" do
		f = Friend.create :user_id => "1", :friend_id => "2", :accepted =>"false" 
		f.should be_valid
	end

	# klappt nicht, wrong number of arguments, warum????
	#it "Anfrage annehmen" do
	#	f = Friend.new :user_id => "1", :friend_id => "2", :accepted =>"false"
	#	f.save 
	#	Friend.update f
	#	f.should be_valid
	#end

	it "loeschen testen" do
		f = Friend.new :user_id => "1", :friend_id => "2", :accepted =>"false" 
		f.save
		f = Friend.delete f 
		if f==1
			be_valid
		end

	end

end