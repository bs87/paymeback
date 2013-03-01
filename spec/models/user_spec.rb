require 'spec_helper.rb'

describe User do
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
end