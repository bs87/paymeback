require 'spec_helper.rb'
describe Debit do

	it "ohne firstname" do
		f = Debit.create :emailcurrentuser => "lukas@admin.de", :emailuser2 => "sabri@admin.de", :betrag => 20, :info => 'Test', :art => 'Verliehen', :id => 1
		f.should_not be_valid
	end

	it "mit allem" do
		f = Debit.create :emailcurrentuser => "lukas@admin.de", :firstname => "Lukas", :emailuser2 => "sabri@admin.de", :betrag => 20, :info => 'Test', :art => 'Verliehen', :id => 1
		f.should be_valid
	end

	it "ohne email" do
		f = Debit.create :emailcurrentuser => "lukas@admin.de", :firstname => "Lukas", :betrag => 20, :info => 'Test', :art => 'Verliehen', :id => 1
		f.should_not be_valid
	end

	it "fehlerhafte email" do
		f = Debit.create :emailcurrentuser => "lukas@admin.de", :firstname => 'Lukas', :emailuser2 => "sabriadminde", :betrag => 20, :info => 'Test', :art => 'Verliehen', :id => 1
		f.should_not be_valid
	end

	it "kein betrag" do
		f = Debit.create :emailcurrentuser => "lukas@admin.de", :firstname => 'Lukas', :emailuser2 => "sabri@admin.de", :info => 'Test', :art => 'Verliehen', :id => 1
		f.should_not be_valid
	end
end