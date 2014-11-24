class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stars, foreign_key: :fan_id, dependent: :destroy
  has_many :favorite_restaurants, through: :stars, source: :restaurant 

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  def owner?
    self.role == 'owner'
  end

  def patron?
    self.role == 'patron'
  end
end
