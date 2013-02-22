class Debit < ActiveRecord::Base
  attr_accessible :betrag, :datum, :emailcurrentuser, :emailuser2, :gezahlt, :info, :art, :owner
  belongs_to :user
end
