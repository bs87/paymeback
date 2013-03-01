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
	#	f = Friend.update f
	#	r = false
	#	if f==1
	#		r=true
	#	else
	#	end
	#	r.should be_true
	#end

	it "loeschen testen" do
		f = Friend.new :user_id => "1", :friend_id => "2", :accepted =>"false" 
		f.save
		f = Friend.delete f 
		r = false
		if f ==1
		 	r=true
		else
		end
		r.should be_true		
	end

  	it "should belong to user" do
		c = Friend.reflect_on_association(:user)
	    c.macro.should == :belongs_to
	end

	it "should belong to friendship" do
		c = Friend.reflect_on_association(:friendship)
	    c.macro.should == :belongs_to
	end
	
	it "friends belongs_to user" do
		friend = Friend.reflect_on_association(:user)
		friend.macro.should == :belongs_to
	end

	it "friends belongs_to friendship" do
		friend = Friend.reflect_on_association (:friendship)
		friend.macro.should == :belongs_to
	end

end