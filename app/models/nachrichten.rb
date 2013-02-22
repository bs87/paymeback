class Nachrichten < ActiveRecord::Base
  attr_accessible :body, :sentby, :sentto, :topic
  belongs_to :user
  belongs_to :nachricht, :class_name => "User"
end
