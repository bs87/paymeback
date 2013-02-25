class Friend < ActiveRecord::Base
  attr_accessible :friend_id, :user_id, :user, :friend
  belongs_to :user,:foreign_key => "user_id"
  belongs_to :user, :foreign_key => "friend_id"
  belongs_to :friendship, :class_name => "User"
end
