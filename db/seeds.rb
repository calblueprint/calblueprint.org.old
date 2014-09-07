s = Semester.where(year: '2014', semester: 'Fall', current: true).first_or_create
Hackathon.where(
  semester: Semester.first,
  name: 'Hack 1',
  registration_link: 'google.com',
  starts: DateTime.now - 1.day,
  ends: DateTime.new + 1.day,
  location: 'Soda',
  description: 'Hello',
  public: true,
).first_or_create

u = User.where(name: 'Admin', email: 'admin@gmail.com', is_activated: true).first_or_create
u.password = "password"
u.save

p = Position.where(name: "VP of Technology", user_type: "exec").first_or_create
Role.where(user: u, semester: s, position: p, name: p.name, user_type: p.user_type).first_or_create
