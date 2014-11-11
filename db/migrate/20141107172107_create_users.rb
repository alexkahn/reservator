class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.text :password_hash
      t.string :passowrd_salt
      t.timestamps
    end
    add_index :users, :username, :unique => true
    add_index :users, :email, :unique => true
  end
end
