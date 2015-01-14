class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :lesson_enrollment, index: true, null: false
      t.belongs_to :question, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :answers, :lesson_enrollments
    add_foreign_key :answers, :questions
    add_index :answers, [:lesson_enrollment_id, :question_id], unique: true
  end
end
