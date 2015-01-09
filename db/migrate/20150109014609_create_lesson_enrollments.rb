class CreateLessonEnrollments < ActiveRecord::Migration
  def change
    create_table :lesson_enrollments do |t|
      t.belongs_to :course_enrollment, index: true, null: false
      t.belongs_to :lesson, index: true, null: false
      t.integer :units_completed, default: 0
      t.timestamp :started_at
      t.timestamp :completed_at

      t.timestamps null: false
    end
    add_foreign_key :lesson_enrollments, :course_enrollments
    add_foreign_key :lesson_enrollments, :lessons
    add_index :lesson_enrollments, [:course_enrollment_id, :lesson_id], unique: true
  end
end
