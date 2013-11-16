# create admin account
puts 'Creating admin user.'
User.create(:email => "admin@berk.com", :password => "password", :name => "Badass Admin", :position => "VP of Technology", :year => "2013", :major => "EECS", :is_activated => true, :is_visible => true, :is_admin => true)

# create other accounts
users = [
  ["jay@berk.com", "Jae Young Ryoo", "President", 2013, "CS & MCB"],
  ["noel@berk.com", "Noel Moldvai", "VP of Technology", 2013, "EECS"],
  ["shirlz@berk.com", "Shirley Liu", "VP of Marketing & Finance", 2013, "Business"],
  ["kevin@berk.com", "Kevin Gong", "VP of Operations", 2014, "CS"],
  ["kenny@berk.com", "Kenneth Gao", "VP of Projects", 2013, "Bioengineering"],
  ["omer@berk.com", "Omer Spillinger", "Technology Chair", 2013, "EECS"],
  ["alice@berk.com", "Alice Oh", "Marketing Chair", 2014, "Political Economy"],
  ["callmebeautiful@berk.com", "Michelle Chow", "Project Leader", "CS & Business"],
  ["bwong@berk.com", "Brian Wong", "Project Leader", 2013, "CS"],
  ["jp@berk.com", "Joshua Primas", "Project Leader", 2013, "CS"],
  ["dp@berk.com", "David Patterson", "Faculty Sponsor"],
  ["fox@berk.com", "Armando Fox", "Faculty Sponsor"]
]

puts 'Creating other users.'
users.each do |u|
  User.create(
    :email => u[0],
    :password => 'password',
    :name => u[1],
    :position => u[2],
    :year => u[3].to_s,
    :major => u[4],
    :is_activated => true,
    :is_visible => true
  )
end
