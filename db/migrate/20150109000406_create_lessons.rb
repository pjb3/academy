class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.belongs_to :course, index: true, null: false
      t.string :name, null: false
      t.integer :number, null: false
      t.text :content
      t.integer :units_count

      t.timestamps null: false
    end

    add_foreign_key :lessons, :courses
    add_index :lessons, [:course_id, :number], unique: true
  end
end
