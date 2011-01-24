class Role < ActiveRecord::Base
  has_many :assignments
end
