class Restaurant < ActiveRecord::Base
  
  belongs_to :owner, class_name: User
  
  has_many :reservations, dependent: :destroy
  has_many :fans, through: :stars
  has_and_belongs_to_many :categories

  validates_presence_of :name 
  validates_presence_of :owner_id

end