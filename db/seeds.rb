# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.delete_all
Restaurant.delete_all
Reservation.delete_all
Star.delete_all

# Generate Patron flavored Users
30.times do
  User.create!({
    email: Faker::Internet.email,
    password: "password",
    role: "patron"
  })
end

# Generate Owner flavored Users
10.times do 
  User.create!({
    email: Faker::Internet.email,
    password: "password",
    role: "owner"
  })
end

# Genreate Restaurants
15.times do
  Restaurant.create!({
    name: Faker::Company.name,
    description: Faker::Lorem.sentence,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    postal_code: Faker::Address.postcode,
    phone: Faker::PhoneNumber.phone_number,
    web: Faker::Internet.url,
    owner_id: User.where(role: "owner").pluck(:id).sample
  })
end

# Generate Reservations
30.times do
  Reservation.create!({
    confirmed: false,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    date: Faker::Date.forward(365),
    time: Time.strptime("17:00", "%H:%M"),
    restaurant_id: Restaurant.pluck(:id).sample
  })
end

# Make some stars
20.times do
  Star.create!({
    fan_id: User.pluck(:id).sample,
    restaurant_id: Restaurant.pluck(:id).sample
  })
end