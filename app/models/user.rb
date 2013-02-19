class User < ActiveRecord::Base 
  rolify
 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me, :photo

#User wird automatisch als reguser angelegt
  after_create :assign_default_role

  def assign_default_role
    add_role(:reguser)
  end
  # attr_accessible :title, :body
  has_many :friends
  has_many :friendships, :through => :friends
  has_many :inverse_friends, :class_name => "Friend", :foreign_key =>"friend_id"
  has_many :inverse_friendships, :through => :inverse_friends, :source => :user
  has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
