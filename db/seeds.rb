course = Course.create!(name: 'Back End Web Development', starts_on: '2014-01-21')

paul = User.create!(first_name: 'Paul', last_name: 'Barry', email: 'mail@paulbarry.com', password: 'password', temporary_password: true)
student = User.create!(first_name: 'Joe', last_name: 'Student', email: 'student@example.com', password: 'password', temporary_password: true)

course.enrollments.create!(user: paul, role: 'instructor')
course.enrollments.create!(user: student, role: 'student')

course.lessons.create!(name: 'Mac OS X', number: 1, description: %{This lesson will cover the basic of using the latest version of Mac OS X, 10.10 Yosemite}).tap do |lesson|

  # TODO: Record Real Videos

  # <iframe width="420" height="315" src="//www.youtube.com/embed/8gkvAt1FYps" frameborder="0" allowfullscreen></iframe>

  unit_1 = lesson.units.create!(name: 'Installing Applications', number: 1, video_url: 'https://www.youtube.com/watch?v=8gkvAt1FYps', video_length: 5)
    # iTerm 2 (copy to Applications)
    # Chrome (open .dmg, copy to Applications)
    # Libre Office (run installer)
    # Navicat (app store)
  unit_2 = lesson.units.create!(name: 'Launching Applications', number: 2, video_url: 'https://www.youtube.com/watch?v=8C-nLj3hE48', video_length: 5)
    # Alfred
  unit_3 = lesson.units.create!(name: 'Switching Applications', number: 3, video_url: 'https://www.youtube.com/watch?v=_-Q5oTxXTBA', video_length: 5)

  lesson.questions.create!(number: 1, content: 'Which of the following numbers is even?', unit: unit_1).tap do |question|
    question.choices.create!(content: '42', correct: true,)
    question.choices.create!(content: '7')
    question.choices.create!(content: '11')
    question.choices.create!(content: '33')
  end

  lesson.questions.create!(number: 2, content: 'Which of the following is not a basic ruby type', unit: unit_2).tap do |question|
    question.choices.create!(content: 'Constant', correct: true)
    question.choices.create!(content: 'String')
    question.choices.create!(content: 'Hash')
    question.choices.create!(content: 'Array')
  end

  lesson.questions.create!(number: 3, content: 'Which of the following expressions does not evaluate to 42?', unit: unit_3).tap do |question|
    question.choices.create!(content: '84 % 2', correct: true)
    question.choices.create!(content: '40 + 2')
    question.choices.create!(content: '6 * 7')
    question.choices.create!(content: '84 / 2')
  end
end

course.lessons.create!(name: 'The Command Line', number: 2).tap do |lesson|
  # Bash Bug
end

course.lessons.create!(name: 'The Atom Text Editor', number: 3).tap do |lesson|
end

course.lessons.create!(name: 'Git Basics', number: 4).tap do |lesson|
end

course.lessons.create!(name: 'Ruby Basics', number: 5).tap do |lesson|
end

course.lessons.create!(name: 'Test-Driven Development with Ruby', number: 6).tap do |lesson|
end

course.lessons.create!(name: 'Functional Programming with Ruby', number: 7).tap do |lesson|
end

course.lessons.create!(name: 'Object Oriented Programming with Ruby', number: 8).tap do |lesson|
end
