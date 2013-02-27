class Debit < ActiveRecord::Base

attr_accessible :betrag, :datum, :emailcurrentuser, :emailuser2, :gezahlt, :info, :art, :firstname, :lastname, :read, :owner

validates :firstname, presence: true
validates :emailuser2, presence: true
validates_format_of :emailuser2, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message => "Ein @ und ein . muss enthalten sein"
validates :betrag, presence: true 

end
