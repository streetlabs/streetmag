class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  # for the time being we will remove "resiterable" :registerable,
  devise :database_authenticatable,  :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :assignments
  has_many :publications, :through => :assignments
  has_many :roles, :through => :assignments
  
  def role?(role)
    self.assignments.map! {|assignement| assignement.role.name.downcase }.include? role.to_s.downcase
  end
  
  def publication(role)
    @role = Role.find_by_name(role.to_s.downcase)
    @roles = self.assignments.where("role_id = ?", @role.id).first
    @roles.publication_id
  end
end
