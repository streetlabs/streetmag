class Publication < ActiveRecord::Base
  has_many :arrangements, :dependent => :destroy
  has_many :authors, :dependent => :destroy
  has_many :issues, :dependent => :destroy
  has_many :sections, :dependent => :destroy
  has_many :authorships, :dependent => :destroy
  has_many :articles, :through => :arrangements, :dependent => :destroy
  has_many :assignments
  has_many :posts
  has_many :site_pages
  has_many :users, :through => :assignments
  validates_presence_of :title
  validates_presence_of :name, :message => "A website name is required."
  validates_format_of :name, :with => /\A[a-zA-Z]+\z/, :message => "Only letters are allowed."
  validates_uniqueness_of :name, :message => "Sorry, that name is already taken."
  
  def news
    posts.order("created_at DESC")
  end

  def managers
    self.users
  end
  
  def owner
    owner = Role.find_by_name('Owner')
    self.assignments.find_by_role_id(owner.id).try(:user)
  end
  
  def editors
    editor = Role.find_by_name('Editor')
    self.assignments.find_all_by_role_id(editor.id).map {|assignment| assignment.user}
  end

end
