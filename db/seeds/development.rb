puts "Creating the semesters"
first_semester = Semester.create(semester: "Spring", year: 2013)
previous_semester = Semester.create(semester: "Fall", year: 2013)
current_semester = Semester.create(semester: "Spring", year: 2014, current: true)

puts "Creating positions"
User.positions_by_type.each_pair do |type, positions|
  positions.each do |position|
    new_role = Position.create(
      name: position,
      user_type: type
    )
    puts "Created position: #{new_role.name} with type: #{new_role.user_type}."
  end
end

# create admin account
puts 'Creating admin user.'
admin_user = User.create(:email => "admin@berk.com", :password => "password", :name => "Badass Admin", :year => "2013", :major => "EECS", :is_activated => true, :is_visible => true)
admin_user.add_role_for_semester(Position.find_by_name("VP of Technology"), first_semester)
puts "\t Created user: #{admin_user.name}."

# create other accounts
users = [
  ["jay@berk.com", "Jae Young Ryoo", "President", 2013, "CS & MCB"],
  ["noel@berk.com", "Noel Moldvai", "VP of Technology", 2013, "EECS"],
  ["shirlz@berk.com", "Shirley Liu", "VP of Marketing & Finance", 2013, "Business"],
  ["kevin@berk.com", "Kevin Gong", "VP of Operations", 2014, "CS"],
  ["kenny@berk.com", "Kenneth Gao", "VP of Projects", 2013, "Bioengineering"],
  ["omer@berk.com", "Omer Spillinger", "Technology Chair", 2013, "EECS"],
  ["callmebeautiful@berk.com", "Michelle Chow", "Project Leader", 2013, "CS & Business"],
  ["bwong@berk.com", "Brian Wong", "Project Leader", 2013, "CS"],
  ["jp@berk.com", "Joshua Primas", "Project Leader", 2013, "CS"],
]

puts 'Creating other users.'
users.each do |u|
  new_user = User.create(
    :email => u[0],
    :password => 'password',
    :name => u[1],
    :year => u.length > 2 ? u[3].to_s : '',
    :major => u.length > 3 ? u[4] : '',
    :is_activated => true,
    :is_visible => true
  )
  new_user.add_role_for_semester(Position.find_by_name(u[2]), first_semester)
  new_user.add_role_for_semester(Position.find_by_name("Alumnus"), current_semester)
  puts "\t Created user: #{new_user.name}."
end

users = [
  ["dp@berk.com", "David Patterson", "Faculty Advisor"],
  ["fox@berk.com", "Armando Fox", "Faculty Advisor"],
]

puts 'Creating Faculty Advisors.'
users.each do |u|
  new_user = User.create(
    :email => u[0],
    :password => 'password',
    :name => u[1],
    :year => u.length > 2 ? u[3].to_s : '',
    :major => u.length > 3 ? u[4] : '',
    :is_activated => true,
    :is_visible => true
  )
  position = Position.find_by_name(u[2])
  new_user.add_role_for_semester(position, first_semester)
  new_user.add_role_for_semester(position, previous_semester)
  new_user.add_role_for_semester(position, current_semester)
  puts "\t Created user: #{new_user.name}."
end

# Current members
current_users = [
  ["melissa@melissa.com", "Melissa Huang", "President", 2015, "CS & Econ"],
  ["mark@mark.com", "Mark Miyashita", "VP of Technology", 2015, "EECS"],
  ["wonjun@wonjun.com", "Wonjun Jeong", "VP of Projects", 2015, "CS"],
  ["jessica@jessica.com", "Jessica Lin", "Internal VP", 2015, "CS & CogSci"],
  ["alice@alice.com", "Alice Oh", "External VP", 2014, "Political Economy & Social Welfare"],
  ["atsu@atsu.com", "Atsu Kakitani", "Project Leader", 2015, "EECS"],
  ["tony@tony.com", "Tony Wu", "Project Leader", 2015, "EECS"],
  ["sam@sam.com", "Sam Lau", "Project Leader", 2017, "EECS"],
  ["howard@howard.com", "Howard Chen", "Project Member", 2016, "CS"],
]

puts "Creating current users"
current_users.each do |u|
  new_user = User.create(
    email: u[0],
    password: 'password',
    name: u[1],
    year: u[3].to_s,
    major: u[4],
    is_activated: true,
    is_visible: true
  )
  new_user.add_role_for_semester(Position.find_by_name(u[2]), current_semester)
  puts "\t Created user: #{new_user.name}."
end

kevin_gong = User.find_by_name("Kevin Gong")
kevin_gong.add_role_for_semester("Project Leader", current_semester)
