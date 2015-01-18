class Choice < ActiveRecord::Base
  belongs_to :question

  validates_presence_of :question_id, :content
  validates_uniqueness_of :content, scope: :question_id

  scope :correct, -> { where(correct: true) }
end
