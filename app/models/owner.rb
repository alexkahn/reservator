class Owner < ActiveRecord::Base
  has_many :restaurants, dependent: :destroy
  has_one :user
end