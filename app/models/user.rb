class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#,:confirmable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  validates :username, :presence => true
  
  has_and_belongs_to_many :roles
  has_many :comments
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

end
