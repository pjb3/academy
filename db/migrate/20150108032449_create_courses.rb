class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.date :starts_on
      t.integer :lessons_count

      t.timestamps null: false
    end
    add_index :courses, :name, unique: true
  end
end
