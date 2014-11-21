class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  
  validates_presence_of :restaurant_id
  validates_presence_of :name
  validates_presence_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

end
