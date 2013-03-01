require 'spec_helper.rb'

describe Nachrichten do
	
	it "schreiben ohen Attribute" do 
		n = Nachrichten.create
		n.should_not be_valid
	end

	it "schreiben nur mit senderid" do
		n = Nachrichten.create :sentby =>"1"
		n.should_not be_valid
	end

	it "schreiben mit senderid und empfaengerid" do
		n = Nachrichten.create :sentby =>"1", :sentto => "2"
		n.should_not be_valid
	end

	it "schreiben ohne Inhalt" do
		n = Nachrichten.create :sentby =>"1", :sentto => "2", :topic => "Essensgeld"
		n.should_not be_valid
	end

	it "schreiben ohne topic" do
		n = Nachrichten.create :sentby =>"1", :sentto => "2", :body => "Das Geld von gestern"
		n.should_not be_valid
	end

	it "schrieben ohne senderid" do
		n = Nachrichten.create :sentto => "2", :topic => "Essensgeld", :body => "Das Geld von gestern"
		n.should_not be_valid
	end

	it "schreiben ohne empfaengerid" do
		n = Nachrichten.create :sentby =>"1", :topic=>"Essensgeld", :body => "Das Geld von gestern"
		n.should_not be_valid
	end

	it "schreiben, einmal mit alles bitte" do
		n = Nachrichten.create :sentby =>"1", :sentto => "2", :topic => "Essensgeld",:body => "Das Geld von gestern"
		n.should be_valid
	end



	#Assoziationen testen

	it "user has_many nachrichtens" do
		user = User.reflect_on_association(:nachrichtens)
		user.macro.should == :has_many
	end

	it "user has_many nachrichts" do
		user = User.reflect_on_association(:nachrichts)
		user.macro.should == :has_many
	end

	it "user has_many inverse_nachrichtens" do
		user = User.reflect_on_association(:inverse_nachrichtens)
		user.macro.should == :has_many
	end

	it "user has_many inverse_nachrichts" do
		user = User.reflect_on_association(:inverse_nachrichts)
		user.macro.should == :has_many
	end

	it "user has many friends" do
		user = User.reflect_on_association(:friends)
		user.macro.should == :has_many
	end

	it "user has many inverse_friends" do
		user = User.reflect_on_association(:inverse_friends)
		user.macro.should == :has_many
	end

	it "user has_many friendships" do
		user = User.reflect_on_association(:friendships)
		user.macro.should == :has_many
	end

	it "user has_many inverse_friendships" do
		user = User.reflect_on_association(:inverse_friendships)
		user.macro.should == :has_many
	end

	it "user has_many debits" do
		user = User.reflect_on_association(:debits)
		user.macro.should == :has_many
	end


	it "nachrichtens belongs_to user" do
		nachrichten = Nachrichten.reflect_on_association(:user)
		nachrichten.macro.should == :belongs_to
	end

	it "nachrichtens belongs_to nachrichts" do
		nachrichten = Nachrichten.reflect_on_association(:nachricht)
		nachrichten.macro.should == :belongs_to
	end

	it "friends belongs_to user" do
		friend = Friend.reflect_on_association(:user)
		friend.macro.should == :belongs_to
	end

	it "friends belongs_to friendship" do
		friend = Friend.reflect_on_association (:friendship)
		friend.macro.should == :belongs_to
	end

	it "debits belongs_to user" do
		debit = Debit.reflect_on_association (:user)
		debit.macro.should == :belongs_to
	end

end

