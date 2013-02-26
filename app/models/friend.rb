class Friend < ActiveRecord::Base
  attr_accessible :friend_id, :user_id, :user, :friend, :accepted
  belongs_to :user,:foreign_key => "user_id"
  belongs_to :user, :foreign_key => "friend_id"
  belongs_to :friendship, :class_name => "User"
  validates_presence_of :friend_id, :user_id
  validates :friend_id, :uniqueness => {:scope => :user_id}
  validate :check_friend_id_and_user_id
end

def check_friend_id_and_user_id
	errors.add(:friend_id, "Man kann sich nicht selber als Freund hinzufuegen") if user_id==friend_id
end
