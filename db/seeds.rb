s = Semester.create! year: '2014', semester: 'Fall', current: true
Hackathon.create! semester: Semester.first, name: 'Hack 1',
  registration_link: 'google.com', starts: DateTime.now - 1.day,
  ends: DateTime.new + 1.day, location: 'Soda', description: 'Hello', public: true

u = User.create! name: 'Admin', email: 'admin@gmail.com', password: 'password'
Role.create! user: u, semester: s, name: 'VP of Technology', user_type: 'exec'
