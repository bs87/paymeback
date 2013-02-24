class Debit < ActiveRecord::Base
  attr_accessible :betrag, :datum, :emailcurrentuser, :emailuser2, :gezahlt, :info, :firstname, :lastname
belongs_to :user
def firstname_name
	user.try(:firstname)
end

def firstname_name=(name)
	self.user = User.find_by_name(firstname)
end
end
