class CourseEnrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  has_many :lesson_enrollments

  INSTRUCTOR = 'instructor'
  STUDENT = 'student'

  ROLES = [INSTRUCTOR, STUDENT]

  validates_presence_of :course_id, :user_id, :role
  validates_inclusion_of :role, in: ROLES

  scope :active, -> { where('dropped_at is null') }
  scope :student, -> { where(role: STUDENT) }
  scope :instructor, -> { where(role: INSTRUCTOR) }

  def instructor?
    role == INSTRUCTOR
  end

  def student?
    role == STUDENT
  end

  def lesson_status(lesson)
    if e = lesson_enrollments.detect{|le| le.lesson == lesson }
      if e.completed?
        :complete
      elsif e.started?
        :started
      end
    end
  end

  def has_started?(lesson)
    lesson_status(lesson).present?
  end

  def has_completed?(lesson)
    lesson_status(lesson) == :completed
  end

  def start_lesson!(lesson)
    lesson_enrollments.find_or_initialize_by(lesson: lesson).tap do |lesson_enrollment|
      lesson_enrollment.start!
    end
  end
end
