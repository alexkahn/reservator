class Owner < ActiveRecord::Base
  has_many :restaurants, dependent: :destroy
end
