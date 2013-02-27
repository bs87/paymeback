require 'spec_helper.rb'
describe Debit do

	it "Create mit art Verliehen" do
		f = Debit.create :emailcurrentuser => "lukas@admin.de", :emailuser2 => "sabri@admin.de", :betrag => 20, :info => 'Test', :art => 'Verliehen', :id => 1
		f.betrag = -20
		f.art = 'Verliehen'
	end
end