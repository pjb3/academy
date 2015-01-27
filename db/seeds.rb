course = Course.create!(name: 'Back End Web Development', starts_on: '2014-01-21')

paul = User.create!(first_name: 'Paul', last_name: 'Barry', email: 'mail@paulbarry.com', password: 'password', temporary_password: true)

course.enrollments.create!(user: paul, role: 'instructor')
