class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.belongs_to :question, index: true, null: false
      t.text :content, null: false
      t.boolean :correct

      t.timestamps null: false
    end
    add_foreign_key :choices, :questions
    add_index :choices, [:question_id, :content], unique: true
  end
end
