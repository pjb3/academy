course = Course.create!(name: 'Back End Web Development', starts_on: '2014-01-21')

paul = User.create!(first_name: 'Paul', last_name: 'Barry', email: 'mail@paulbarry.com', password: 'password', temporary_password: true)
student = User.create!(first_name: 'Joe', last_name: 'Student', email: 'student@example.com', password: 'password', temporary_password: true)

course.enrollments.create!(user: paul, role: 'instructor')
course.enrollments.create!(user: student, role: 'student')

course.lessons.create!(name: 'Mac OS X', description: %{This lesson will cover the basics of using the latest version of Mac OS X, 10.10 Yosemite}).tap do |lesson|

  lesson.units.create!(name: 'Launching Applications', video_url: 'https://www.youtube.com/watch?v=irkU8GsQHRU', video_length: 188).tap do |unit|
    lesson.questions.create!(content: 'What is the fastest way to launch an application?', unit: unit).tap do |question|
      question.choices.create!(content: 'Spotlight', correct: true,)
      question.choices.create!(content: 'Dock')
      question.choices.create!(content: 'Finder')
      question.choices.create!(content: 'Start Menu')
    end

    lesson.questions.create!(content: 'What is keyboard shortcut for Spotlight?', unit: unit).tap do |question|
      question.choices.create!(content: 'Command + Space', correct: true,)
      question.choices.create!(content: 'Control + Space')
      question.choices.create!(content: 'Option + Space')
      question.choices.create!(content: 'Command + Tab')
    end
  end

  lesson.units.create!(name: 'System Preferences', video_url: 'https://www.youtube.com/watch?v=oYFhLBUHdpg', video_length: 312).tap do |unit|
    lesson.questions.create!(content: 'Where can you customize your Mac setting?', unit: unit).tap do |question|
      question.choices.create!(content: 'System Preferences', correct: true)
      question.choices.create!(content: 'Control Panel')
      question.choices.create!(content: 'Spotlight')
      question.choices.create!(content: 'Finder')
    end
  end

  lesson.units.create!(name: 'Switching Between Applications', video_url: 'https://www.youtube.com/watch?v=Wt3dcQTihCU', video_length: 179).tap do |unit|
    lesson.questions.create!(content: 'What is the keyboard shortcut to switch between running applications?', unit: unit).tap do |question|
      question.choices.create!(content: 'Command + Tab', correct: true)
      question.choices.create!(content: 'Command + Space')
      question.choices.create!(content: 'Control + Space')
      question.choices.create!(content: 'Option + Space')
    end
  end

  lesson.units.create!(name: 'Installing Applications', video_url: 'https://www.youtube.com/watch?v=CzJdQU1xBWE', video_length: 410).tap do |unit|
    lesson.questions.create!(content: 'Which of the following is not a way to install an application?', unit: unit).tap do |question|
      question.choices.create!(content: 'Double-clicking on an application in a disk image', correct: true)
      question.choices.create!(content: 'Dragging an application from the Downloads folder into the Applications folder')
      question.choices.create!(content: 'Running an installer from a disk image')
      question.choices.create!(content: 'Dragging an application from a disk image to the Applications folder')
    end
  end

  lesson.units.create!(name: 'Running Installers', video_url: 'https://www.youtube.com/watch?v=e6KSY8PO7rg', video_length: 165)
end

course.lessons.create!(name: 'The Command Line').tap do |lesson|
  lesson.units.create!(name: 'Setup iTerm', video_url: 'https://www.youtube.com/watch?v=uIZlSKi8wn4', video_length: 313)

  lesson.units.create!(name: 'Running Commands in Bash', video_url: 'https://www.youtube.com/watch?v=WkVrge3tv7Q', video_length: 173).tap do |unit|
    lesson.questions.create!(content: 'What is the default shell in Mac OS X?', unit: unit).tap do |question|
      question.choices.create!(content: 'bash', correct: true)
      question.choices.create!(content: 'zsh')
      question.choices.create!(content: 'iterm')
      question.choices.create!(content: 'Terminal')
    end
  end

  lesson.units.create!(name: 'Using Variables in Commands', video_url: 'https://www.youtube.com/watch?v=0TjnAP1XN-g', video_length: 138).tap do |unit|
    lesson.questions.create!(content: 'In bash, what character to prepend to a variable to get the value?', unit: unit).tap do |question|
      question.choices.create!(content: '$', correct: true)
      question.choices.create!(content: '|')
      question.choices.create!(content: '"')
      question.choices.create!(content: '@')
    end
  end

  lesson.units.create!(name: 'Sorting and Searching Using Pipes', video_url: 'https://www.youtube.com/watch?v=I-tOxga_-jI', video_length: 157).tap do |unit|
    lesson.questions.create!(content: 'In bash, what character do you use to send the output of one command to the input of another?', unit: unit).tap do |question|
      question.choices.create!(content: '|', correct: true)
      question.choices.create!(content: '>')
      question.choices.create!(content: '$')
      question.choices.create!(content: '@')
    end

    lesson.questions.create!(content: 'Which bash command is used to search through content?', unit: unit).tap do |question|
      question.choices.create!(content: 'grep', correct: true)
      question.choices.create!(content: 'search')
      question.choices.create!(content: 'sort')
      question.choices.create!(content: 'env')
    end
  end

  lesson.units.create!(name: 'Directories and Paths', video_url: 'https://www.youtube.com/watch?v=2h1o-nd6coc', video_length: 344).tap do |unit|
    lesson.questions.create!(content: 'Which of the following is a relative path?', unit: unit).tap do |question|
      question.choices.create!(content: 'Applications', correct: true)
      question.choices.create!(content: '/Applications')
      question.choices.create!(content: '/Users/paul')
      question.choices.create!(content: '/')
    end
  end

  lesson.units.create!(name: 'Working With Files', video_url: 'https://www.youtube.com/watch?v=MmBPzHencZU', video_length: 230).tap do |unit|
    lesson.questions.create!(content: 'Which key will make bash complete the name of a file?', unit: unit).tap do |question|
      question.choices.create!(content: 'tab', correct: true)
      question.choices.create!(content: 'space')
      question.choices.create!(content: 'return')
      question.choices.create!(content: 'control')
    end
  end

  lesson.units.create!(name: 'History and Other Shortcuts', video_url: 'https://www.youtube.com/watch?v=ST73BdrbBC8', video_length: 182).tap do |unit|
    lesson.questions.create!(content: 'Which keyboard shortcut will bring the cursor to the beginning of the line in bash?', unit: unit).tap do |question|
      question.choices.create!(content: 'control + a', correct: true)
      question.choices.create!(content: 'control + e')
      question.choices.create!(content: 'command + a')
      question.choices.create!(content: 'command + e')
    end
  end

  lesson.units.create!(name: 'The PATH Enviornment Variable', video_url: 'https://www.youtube.com/watch?v=ZUrKdo8Bh8s', video_length: 368).tap do |unit|
    lesson.questions.create!(content: 'Which of these directories in not in the PATH variable by default?', unit: unit).tap do |question|
      question.choices.create!(content: '$HOME/bin', correct: true)
      question.choices.create!(content: '/usr/local/bin')
      question.choices.create!(content: '/usr/bin')
      question.choices.create!(content: '/bin')
    end

    lesson.questions.create!(content: 'Which command can be used to find the location of a command?', unit: unit).tap do |question|
      question.choices.create!(content: 'which', correct: true)
      question.choices.create!(content: 'cat')
      question.choices.create!(content: 'ls')
      question.choices.create!(content: 'grep')
    end
  end

  lesson.units.create!(name: 'Exporting Variables', video_url: 'https://www.youtube.com/watch?v=M_nMei9eKtc', video_length: 183).tap do |unit|
    lesson.questions.create!(content: 'In bash, what do you need to use to make a variable visible by child processes?', unit: unit).tap do |question|
      question.choices.create!(content: 'export', correct: true)
      question.choices.create!(content: 'which')
      question.choices.create!(content: 'echo')
      question.choices.create!(content: 'cat')
    end
  end

  lesson.units.create!(name: 'Configuring Bash', video_url: 'https://www.youtube.com/watch?v=zsiwtYJcQiQ', video_length: 484).tap do |unit|
    lesson.questions.create!(content: 'Which file is read and executed by bash when it starts?', unit: unit).tap do |question|
      question.choices.create!(content: '.bash_profile', correct: true)
      question.choices.create!(content: 'bash_profile')
      question.choices.create!(content: '.bash_config')
      question.choices.create!(content: 'bash_config')
    end
  end

  lesson.units.create!(name: 'Processes', video_url: 'https://www.youtube.com/watch?v=r42wvy80j1s', video_length: 291).tap do |unit|
    lesson.questions.create!(content: 'Which command is used in bash to see a list of running processes?', unit: unit).tap do |question|
      question.choices.create!(content: 'ps', correct: true)
      question.choices.create!(content: 'ls')
      question.choices.create!(content: 'grep')
      question.choices.create!(content: 'processes')
    end

    lesson.questions.create!(content: 'Which command is used in bash to stop a running process?', unit: unit).tap do |question|
      question.choices.create!(content: 'kill', correct: true)
      question.choices.create!(content: 'stop')
      question.choices.create!(content: 'ps')
      question.choices.create!(content: 'term')
    end
  end

  lesson.units.create!(name: 'Security and Permissions', video_url: 'https://www.youtube.com/watch?v=2muv2IyXSM0', video_length: 354).tap do |unit|
    lesson.questions.create!(content: 'Which command is used to change the permissions of a file?', unit: unit).tap do |question|
      question.choices.create!(content: 'chmod', correct: true)
      question.choices.create!(content: 'chown')
      question.choices.create!(content: 'ls -la')
      question.choices.create!(content: 'modperm')
    end
  end

  lesson.units.create!(name: 'The root user and the sudo command', video_url: 'https://www.youtube.com/watch?v=n3fFmtUaZYo', video_length: 355).tap do |unit|
    lesson.questions.create!(content: 'Which command is used to run a command as the root user?', unit: unit).tap do |question|
      question.choices.create!(content: 'chmod', correct: true)
      question.choices.create!(content: 'root')
      question.choices.create!(content: 'sudo')
      question.choices.create!(content: 'ex')
    end
  end

end

course.lessons.create!(name: 'The Atom Text Editor').tap do |lesson|
end

course.lessons.create!(name: 'Git Basics').tap do |lesson|
end

course.lessons.create!(name: 'Ruby Basics').tap do |lesson|
end

course.lessons.create!(name: 'Test-Driven Development with Ruby').tap do |lesson|
end

course.lessons.create!(name: 'Functional Programming with Ruby').tap do |lesson|
end

course.lessons.create!(name: 'Object Oriented Programming with Ruby').tap do |lesson|
end
