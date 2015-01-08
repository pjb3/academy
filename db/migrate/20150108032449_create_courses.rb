class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.date :starts_on
      t.integer :lessons_count

      t.timestamps null: false
    end
  end
end
