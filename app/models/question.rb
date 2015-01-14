class Question < ActiveRecord::Base
  belongs_to :lesson, counter_cache: true
  belongs_to :unit

  has_many :choices

  validates_presence_of :lesson_id, :unit_id
  validates_uniqueness_of :number, scope: :lesson_id
end
