class UnitEnrollment < ActiveRecord::Base
  belongs_to :lesson_enrollment
  belongs_to :unit

  validates_presence_of :lesson_enrollment_id, :unit_id
  validates_presence_of :lesson_enrollment_id, scope: :unit_id

  def started?
    started_at.present?
  end

  def completed?
    completed_at.present?
  end

  def start!
    unless started?
      update!(started_at: Time.current)
    end
  end

  def complete!
    unless completed?
      update!(completed_at: Time.current)
    end
  end
end
