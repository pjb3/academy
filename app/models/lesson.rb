class Lesson < ActiveRecord::Base
  belongs_to :course, counter_cache: true

  has_many :units
  has_many :questions
  has_many :lesson_enrollments

  validates_presence_of :course_id, :name, :number
  validates_uniqueness_of :number, scope: :course_id

  def next
    @next ||= course.lessons.where(number: number + 1).first
  end

  def prev
    @prev ||= course.lessons.where(number: number - 1).first
  end

  def first?
    number == 1
  end

  def update_total_video_length
    update(total_video_length: units.sum(:video_length))
  end

  def first_question
    questions.order('number').first
  end

end
