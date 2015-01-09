class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.belongs_to :lesson, index: true, null: false
      t.string :name, null: false
      t.integer :number, null: false
      t.string :video_url
      t.text :content

      t.timestamps null: false
    end

    add_index :units, [:lesson_id, :number], unique: true
  end
end
