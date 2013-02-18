class Friend < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  belongs_to :user
  belongs_to :friendship, :class_name => "User"
end
