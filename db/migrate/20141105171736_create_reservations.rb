class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.boolean :confirmed
      t.string :name
      t.string :email
      t.date :date
      t.time :time
      
      t.timestamps
    end
  end
end
