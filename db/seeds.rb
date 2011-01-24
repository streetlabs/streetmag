# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



Role.create([
  {:name => 'Owner', :description => 'The publication\'s owner.'}, 
  {:name => 'Editor', :description => 'Can edit all works in the publication.'}, 
  {:name => 'Contributor', :description => 'Can contribute to the publication.'}]) unless Role.all.size > 1
  
admin = User.find_by_email('admin@streetmag.org')
admin ||=  User.create(:email => 'admin@streetmag.org', :password =>'Bake-a-cake!') 
admin.confirmed_at = DateTime.now
admin.is_admin = true
admin.save!