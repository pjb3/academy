class UnitEnrollment < ActiveRecord::Base
  belongs_to :lesson_enrollment
  belongs_to :unit

  validates_presence_of :lesson_enrollment_id, :unit_id
  validates_presence_of :lesson_enrollment_id, scope: :unit_id

  scope :incomplete, -> { where(completed_at: nil) }

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
      lesson_enrollment.complete_if_done!
    end
  end

  def can_be_completed_at
    if started?
      started_at + unit.video_length.to_i.seconds
    end
  end

  def can_be_completed_in
    if can_be_completed?
      0
    else
      can_be_completed_at - Time.current
    end
  end

  def can_be_completed?
    started? && can_be_completed_at < Time.current
  end

end
