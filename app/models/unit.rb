class Unit < ActiveRecord::Base
  belongs_to :lesson, counter_cache: true

  validates_presence_of :lesson_id, :name, :number
  validates_uniqueness_of :number, scope: :lesson_id
end
