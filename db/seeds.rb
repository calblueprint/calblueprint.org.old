Semester.create! year: '2014', semester: 'Spring', current: false
Hackathon.create! semester: Semester.first, name: 'Hack 1',
  registration_link: 'google.com', starts: DateTime.now - 1.day,
  ends: DateTime.new + 1.day, location: 'Soda', description: 'Hello', public: true
