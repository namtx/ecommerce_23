class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.boolean :is_admin
      t.string :image

      t.timestamps
    end
    add_index :users, [:user_name, :email], unique: true
  end
end
