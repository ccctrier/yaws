# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

public

def create_roles
	Role.delete_all
	Role.create(:name=>'admin', :description=>'Admin')
	Role.create(:name=>'user', :description=>'User')
end

def create_users
	User.delete_all
	User.create(:username => "petra", :password => "ocksendorf", :password_confirmation => "ocksendorf", :email => "petra@c3t.de")
end

create_roles
#create_users
