class Assignment < ActiveRecord::Base
  belongs_to :publication
  belongs_to :user
  belongs_to :role
end
