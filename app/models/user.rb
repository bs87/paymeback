class User < ActiveRecord::Base 
  rolify
 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me, :city, :zip, :dateofbirth, :adress, :photo, :friends, :lock,  :role_ids, :failed_attempts, :unlock_token, :locked_at

  has_many :debits
  has_many :nachrichtens
  has_many :nachrichts, :through => :nachrichtens
  has_many :inverse_nachrichtens, :class_name => "Nachrichten", :foreign_key =>"sentto"
  has_many :inverse_nachrichts, :through => :inverse_nachrichtens, :source => :user


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
  


  has_attached_file :photo, :default_url => "/assets/missing.png", :storage => :dropbox,:dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml", :styles => { :small => "150x150>", :tiny => "50x50", :icon => "16x16" },:dropbox_options => {       
:path => proc { |style| "#{style}/#{id}_#{photo.original_filename}"},:unique_filename => true }
                  #:url  => "/assets/users/:id/:style/:basename.:extension",
                  #:path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"


#Postleitzahl hat 5 Ziffern
validates :email, :uniqueness => true
validates :zip, :length=>{:minimum=>5, :maximum=>5}
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
