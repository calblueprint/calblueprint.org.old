# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create admin account
User.create(:email => "noel@berk.com", :password => "password", :name => "Noel Moldvai", :position => "VP of Technology", :year => "2013", :major => "EECS", :site => "http://noeleon.com", :is_activated => true, :is_admin => true)
# create other accounts
User.create(:email => "jay@berk.com", :password => "password", :name => "Jae Young Ryoo", :position => "President", :year => "2013", :major => "CS & MCB")
User.create(:email => "shirlz@berk.com", :password => "password", :name => "Shirley Liu", :position => "VP of Marketing & Finance", :year => "2013", :major => "Business")
User.create(:email => "kevin@berk.com", :password => "password", :name => "Kevin Gong", :position => "VP of Operations", :year => "2014", :major => "CS")
User.create(:email => "kenny@berk.com", :password => "password", :name => "Kenneth Gao", :position => "VP of Projects", :year => "2013", :major => "Bioengineering")
User.create(:email => "oamz@berk.com", :password => "password", :name => "Omer Spillinger", :position => "Technology Chair", :year => "2013", :major => "EECS")
User.create(:email => "callmebeautiful@berk.com", :password => "password", :name => "Michelle Chow", :position => "Project Leader", :year => "2013", :major => "CS & Business")
User.create(:email => "bwong@berk.com", :password => "password", :name => "Brian Wong", :position => "Project Leader", :year => "2013", :major => "CS")
User.create(:email => "jp@berk.com", :password => "password", :name => "Joshua Primas", :position => "Project Leader", :year => "2013", :major => "CS")
User.create(:email => "dp@berk.com", :password => "password", :name => "David Patterson", :position => "Faculty Sponsor", :site => "http://eecs.berkeley.edu/Faculty/Homepages/patterson.html")
User.create(:email => "fox@berk.com", :password => "password", :name => "Armando Fox", :position => "Faculty Sponsor", :site => "http://eecs.berkeley.edu/Faculty/Homepages/fox.html")
