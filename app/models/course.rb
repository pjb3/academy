class Course < ActiveRecord::Base

  has_many :enrollments, class_name: 'CourseEnrollment'

  def active_student_enrollment_count
    @active_student_enrollment_count ||= enrollments.active.student.count
  end
end
