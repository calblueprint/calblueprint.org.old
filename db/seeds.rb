# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.create(:name => "Jae Young Ryoo", :position => "President", :year => "2013", :major => "CS & MCB")
Member.create(:name => "Noel Moldvai", :position => "VP of Technology", :year => "2013", :major => "EECS")
Member.create(:name => "Shirley Liu", :position => "VP of Marketing & Finance", :year => "2013", :major => "Business")
Member.create(:name => "Kevin Gong", :position => "VP of Operations", :year => "2014", :major => "CS")
Member.create(:name => "Kenneth Gao", :position => "VP of Projects", :year => "2013", :major => "Bioengineering")
Member.create(:name => "Omer Spillinger", :position => "Technology Chair", :year => "2013", :major => "EECS")
Member.create(:name => "Michelle Chow", :position => "Project Leader", :year => "2013", :major => "CS & Business")
Member.create(:name => "Brian Wong", :position => "Project Leader", :year => "2013", :major => "CS")
Member.create(:name => "Joshua Primas", :position => "Project Leader", :year => "2013", :major => "CS")