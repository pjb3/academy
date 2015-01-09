class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :password_digest
      t.boolean :temporary_password
      t.timestamp :last_logged_in_at

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
