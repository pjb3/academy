class LessonEnrollment < ActiveRecord::Base
  belongs_to :course_enrollment
  belongs_to :lesson

  validates_presence_of :course_enrollment_id, :lesson_id
  validates_uniqueness_of :course_enrollment_id, scope: :lesson_id

  def started?
    started_at.present?
  end

  def completed?
    completed_at.present?
  end
end
