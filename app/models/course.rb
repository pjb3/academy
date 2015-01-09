class Course < ActiveRecord::Base

  has_many :enrollments, class_name: 'CourseEnrollment'
  has_many :lessons

  validates_presence_of :name
  validates_uniqueness_of :name

  def active_student_enrollment_count
    @active_student_enrollment_count ||= enrollments.active.student.count
  end
end
