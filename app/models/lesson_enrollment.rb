class LessonEnrollment < ActiveRecord::Base
  belongs_to :course_enrollment
  belongs_to :lesson

  has_many :unit_enrollments

  validates_presence_of :course_enrollment_id, :lesson_id
  validates_uniqueness_of :course_enrollment_id, scope: :lesson_id

  scope :incomplete, -> { where(completed_at: nil) }

  def started?
    started_at.present?
  end

  def completed?
    completed_at.present?
  end

  def unit_status(unit)
    if e = unit_enrollments.detect{|ue| ue.unit == unit }
      if e.completed?
        :complete
      elsif e.started?
        :started
      end
    end
  end

  def has_started?(unit)
    unit_status(unit).present?
  end

  def has_completed?(unit)
    unit_status(unit) == :complete
  end

  def start!
    unless started?
      update!(started_at: Time.current)
    end
  end

  def start_unit!(unit)
    unit_enrollments.find_or_initialize_by(unit: unit).tap do |unit_enrollment|
      unit_enrollment.start!
    end
  end

  def complete!
    unless completed?
      update!(completed_at: Time.current)
      course_enrollment.complete_if_done!
    end
  end

  def done?
    !unit_enrollments.incomplete.exists?
  end

  def complete_if_done!
    complete! if done?
  end
end
