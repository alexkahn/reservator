class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: User
  has_many :reservations, dependent: :destroy
  has_many :categories, through: :restaurant_categories

  validates_presence_of :name 
  validates_presence_of :owner_id
end
