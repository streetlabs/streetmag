class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  # for the time being we will remove "resiterable" :registerable,
  devise :database_authenticatable,  :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_protected :is_admin
  
  has_many :assignments
  has_many :publications, :through => :assignments
  has_many :roles, :through => :assignments
  
  def role?(role)
    roles = self.assignments.collect {|assignement| assignement.role.name.downcase }
    roles.include? role.to_s.downcase
  end
  
  def role(publication)
    return nil if publication == nil
    self.roles.where("publication_id = ?", publication.id).first
  end
end
