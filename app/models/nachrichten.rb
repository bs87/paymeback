class Nachrichten < ActiveRecord::Base
  attr_accessible :body, :sentby, :sentto, :topic, :read
  belongs_to :user
  belongs_to :nachricht, :class_name => "User"
  # Prüfung auf Vorhandensein 
  validates_presence_of :sentby, :sentto, :topic, :body
end
