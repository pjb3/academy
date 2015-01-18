class Question < ActiveRecord::Base
  include Numbered

  belongs_to :lesson, counter_cache: true
  belongs_to :unit

  has_many :choices

  validates_presence_of :lesson_id, :unit_id
  validates_uniqueness_of :number, scope: :lesson_id

  def next
    @next ||= lesson.questions.where(number: number + 1).first
  end

  def prev
    @prev ||= lesson.questions.where(number: number - 1).first
  end

  def first?
    number == 1
  end

  def correct_choice
    choices.correct.first
  end

  def number_scope
    lesson.questions
  end
end
