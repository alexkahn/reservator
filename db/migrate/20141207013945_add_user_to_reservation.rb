class AddUserToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :patron_id, :integer
    add_index :reservations, :patron_id
  end
end
