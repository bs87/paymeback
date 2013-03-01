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

	it "destroy testen" do
		f = Debit.create :emailcurrentuser => "lukas@admin.de", :firstname => "Lukas", :emailuser2 => "sabri@admin.de", :betrag => 20, :info => 'Test', :art => 'Verliehen' 
		f.save
		f = Debit.delete f 
		r = false
		if f ==1
		 	r=true
		else
		end
		r.should be_true
	end

	it "update testen" do
		f = Debit.create :emailcurrentuser => "lukas@admin.de", :firstname => "Lukas", :emailuser2 => "sabri@admin.de", :betrag => 20, :info => 'Test', :art => 'Verliehen' 
		f.save
		r = false 
		if f.update_attributes :emailcurrentuser => "lukas@admin.de", :firstname => "Lukas", :emailuser2 => "sabri@admin.de", :betrag => 40, :info => 'Test', :art => 'Geliehen' 
			r = true
		else
		end
		r.should be_true
	end
	
	it "debits belongs_to user" do
		debit = Debit.reflect_on_association (:user)
		debit.macro.should == :belongs_to
	end
end