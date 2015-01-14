class Answer < ActiveRecord::Base
  belongs_to :lesson_enrollment, counter_cache: true
  belongs_to :question

  validates_presence_of :lesson_enrollment_id, :question_id
  validates_uniqueness_of :question_id, scope: :lesson_enrollment_id
end
