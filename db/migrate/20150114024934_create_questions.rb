class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :lesson, index: true, null: false
      t.belongs_to :unit, index: true, null: false
      t.integer :number, null: false
      t.text :content, null: false

      t.timestamps null: false
    end
    add_foreign_key :questions, :lessons
    add_foreign_key :questions, :units
    add_index :questions, [:lesson_id, :number], unique: true
  end
end
