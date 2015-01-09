class CreateUnitEnrollments < ActiveRecord::Migration
  def change
    create_table :unit_enrollments do |t|
      t.belongs_to :lesson_enrollment, index: true, null: false
      t.belongs_to :unit, index: true, null: false
      t.timestamp :started_at
      t.timestamp :completed_at

      t.timestamps null: false
    end
    add_foreign_key :unit_enrollments, :lesson_enrollments
    add_foreign_key :unit_enrollments, :units
    add_index :unit_enrollments, [:lesson_enrollment_id, :unit_id], unique: true
  end
end
