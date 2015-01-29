namespace :syllabus do
  desc "Print the Syllabus for the course in Markdown"
  task :markdown => :environment do
    course = Course.first
    puts "# #{course.name}"
    puts ""
    course.lessons.order('number').each do |l|
      puts "## #{l.name}"
      puts ""
      l.units.order('number').each do |u|
        puts "* [#{u.name}](#{u.video_url}) #{Formatting.hms(u.video_length, show_hour_if_zero: false)}"
      end
      puts ""
    end
  end

  desc "Print the Syllabus and content in YAML"
  task :yaml => :environment do
    course = Course.includes(:lessons => [ :units, { :questions => :choices } ]).first
    lessons = []
    course.lessons.order('number').each do |lesson|
      l = lesson.slice(:name, :description).to_h

      l['units'] = []
      lesson.units.order('number').each do |unit|
        l['units'] << unit.slice(:name, :video_url, :video_length).to_h
      end

      l['questions'] = []
      lesson.questions.order('number').each do |question|
        q = question.slice(:content).to_h
        q['choices'] = []
        question.choices.each do |choice|
          q['choices'] << choice.slice(:content).to_h.tap{|h| h['correct'] = true if choice.correct? }
        end
        l['questions'] << q
      end
      l.delete('questions') unless l['questions'].present?

      lessons << l
    end

    puts lessons.to_yaml
  end

  desc "Load new content from Syllabus YAML"
  task :load => :environment do
    lessons = YAML.load_file(Rails.root.join("db/courses/back_end_web_development.yml"))

    course = Course.first
    lessons.each do |lesson|
      l = course.lessons.find_by(name: lesson['name']) || course.lessons.build(lesson.slice(*%w[name description]))
      l.save!

      Array(lesson['units']).each do |unit|
        u = l.units.find_by(name: unit['name']) || l.units.build(unit.slice(*%w[name video_url video_length]))
        u.save!
      end

      # TODO: Fix loading of questions, need a way to associate them to a unit
      # Array(lesson['questions']).each do |question|
      #   q = l.questions.find_by(content: question['content']) || l.questions.build(question.slice(*%w[content]))
      #   q.save!
      #
      #   Array(question['choices']).each do |choice|
      #     c = q.choices.find_by(content: choice['content']) || q.choices.build(choice.clice(*%[content correct]))
      #     c.save!
      #   end
      # end
    end
  end
end
