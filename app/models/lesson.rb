class Lesson < ActiveRecord::Base
  belongs_to :course, counter_cache: true

  has_many :units

  validates_presence_of :course_id, :name, :number
  validates_uniqueness_of :number, scope: :course_id
end
