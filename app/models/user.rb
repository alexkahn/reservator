class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :restaurants, foreign_key: :owner_id
  has_many :owned_restaurants, through: :restaurants, source: :owner

  has_many :stars, foreign_key: :fan_id, dependent: :nullify
  has_many :favorite_restaurants, through: :stars, source: :restaurant 

  has_many :reservations, foreign_key: :patron_id

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  def owner?
    role == 'owner'
  end

  def patron?
    role == 'patron'
  end
end
