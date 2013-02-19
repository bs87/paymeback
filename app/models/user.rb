class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me, :city, :zip, :dateofbirth, :adress


#Postleitzahl hat 5 Ziffern
validates :zip, :length=>{:minimum=>5, :maximum=>5}

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


end
