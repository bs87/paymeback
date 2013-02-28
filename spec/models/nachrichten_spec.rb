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

end



