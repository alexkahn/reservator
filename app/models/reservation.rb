class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :patron, class_name: User

  validates_presence_of :restaurant_id
  validates_presence_of :date_time
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :patron
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

end