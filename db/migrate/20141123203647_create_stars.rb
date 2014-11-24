class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :fan_id
      t.integer :restaurant_id
      
      t.timestamps
    end
  end
end
