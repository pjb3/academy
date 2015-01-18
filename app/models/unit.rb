class Unit < ActiveRecord::Base
  include Numbered

  belongs_to :lesson, counter_cache: true

  validates_presence_of :lesson_id, :name, :number
  validates_uniqueness_of :number, scope: :lesson_id

  after_save :update_lesson_total_video_length

  def next
    @next ||= lesson.units.where(number: number + 1).first
  end

  def prev
    @prev ||= lesson.units.where(number: number - 1).first
  end

  def first?
    number == 1
  end

  def update_lesson_total_video_length
    lesson.update_total_video_length
  end

  def number_scope
    lesson.units
  end

end
