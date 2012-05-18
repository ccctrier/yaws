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
	User.create(:username => "petra", :password => "ocksendorf", :password_confirmation => "ocksendorf", :email => "petra@c3t.de", :role => Role.where(:name => "admin").first.id)
end

def create_sections
	Section.delete_all
	Section.create(:name=>'News')
	Section.create(:name=>'Page')
	Section.create(:name=>'Ausgehackt')
end

def create_planet_entries
	Backend::Planet.delete_all
	Backend::Planet.create(:url => "http://ausgehackt.c3t.de/rss")
	Backend::Planet.create(:url => "http://patrick.ripp.eu/rss")
	Backend::Planet.create(:url => "http://giz.me/rss")
	Backend::Planet.create(:url => "http://terter.ath.cx/blog/de/blog_rss")
	Backend::Planet.create(:url => "http://kaiserliches.wordpress.com/rss")
	Backend::Planet.create(:url => "http://slog.io/feed")
	Backend::Planet.create(:url => "http://www.fidepus.de/?feed=rss2")
	Backend::Planet.create(:url => "http://anykwhere.blogspot.com/feeds/posts/default")
end

#create_roles
#create_users
create_sections
create_planet_entries
