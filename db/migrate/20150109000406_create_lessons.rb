class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.belongs_to :course, index: true, null: false
      t.string :name, null: false
      t.integer :number, null: false
      t.text :description
      t.integer :units_count
      t.integer :questions_count
      t.integer :total_video_length

      t.timestamps null: false
    end

    add_foreign_key :lessons, :courses
    add_index :lessons, [:course_id, :number], unique: true
  end
end
