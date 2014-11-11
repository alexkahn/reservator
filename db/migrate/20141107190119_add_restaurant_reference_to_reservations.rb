class AddRestaurantReferenceToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :restaurant, :reservations
  end
end
