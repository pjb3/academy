class Course < ActiveRecord::Base
  has_many :instructors, class_name: 'CourseInstructor'
  has_many :enrollments, class_name: 'CourseEnrollment'
end
