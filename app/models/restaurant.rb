class Restaurant < ActiveRecord::Base
  belongs_to :owner
  has_many :reservations, dependent: :destroy
end
