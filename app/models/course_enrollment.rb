class CourseEnrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  INSTRUCTOR = 'instructor'

  scope :active, -> { where('dropped_at is null') }
  scope :student, -> { where(role: 'student') }

  def instructor?
    role == INSTRUCTOR
  end
end
