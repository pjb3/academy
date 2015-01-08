class CreateCourseInstructors < ActiveRecord::Migration
  def change
    create_table :course_instructors do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :course_instructors, :courses
    add_foreign_key :course_instructors, :users
  end
end
