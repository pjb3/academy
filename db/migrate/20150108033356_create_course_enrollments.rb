class CreateCourseEnrollments < ActiveRecord::Migration
  def change
    create_table :course_enrollments do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
      t.integer :lessons_completed

      t.timestamps null: false
    end
    add_foreign_key :course_enrollments, :courses
    add_foreign_key :course_enrollments, :users
  end
end
