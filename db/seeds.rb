# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:name => "Jae Young Ryoo", :email => "jay.ryoo@gmail.com", :title => "executive", :title => "executive", :password => "password", :position => "President", :year => "2013", :major => "CS & MCB")
User.create(:name => "Noel Moldvai", :email => "noelmoldvai@gmail.com", :title => "executive", :password => "password", :position => "VP of Technology", :year => "2013", :major => "EECS")
User.create(:name => "Shirley Liu", :email => "bluedroplet88@gmail.com", :title => "executive", :password => "password", :position => "VP of Marketing & Finance", :year => "2013", :major => "Business")
User.create(:name => "Kevin Gong", :email => "kevinkgong@gmail.com", :title => "executive", :password => "password", :position => "VP of Operations", :year => "2014", :major => "CS")
User.create(:name => "Kenneth Gao", :email => "ktgao90@gmail.com", :title => "executive", :password => "password", :position => "VP of Projects", :year => "2013", :major => "Bioengineering")
User.create(:name => "Omer Spillinger", :email => "spillio88@gmail.com", :title => "chair", :password => "password", :position => "Technology Chair", :year => "2013", :major => "EECS")
User.create(:name => "Michelle Chow", :email => "callmemc@gmail.com", :title => "project_leader", :password => "password", :position => "Project Leader", :year => "2013", :major => "CS & Business")
User.create(:name => "Brian Wong", :email => "brianwong.bmw@gmail.com", :title => "project_leader", :password => "password", :position => "Project Leader", :year => "2013", :major => "CS")
User.create(:name => "Joshua Primas", :email => "JoshuaPrimas@gmail.com", :title => "project_leader", :password => "password", :position => "Project Leader", :year => "2013", :major => "CS")
User.create(:name => "David Patterson", :email => "pattrsn@eecs.berkeley.edu", :title => "faculty_sponsor", :password => "password", :position => "Faculty Sponsor", :site =>"www.eecs.berkeley.edu/Faculty/Homepages/patterson.html")