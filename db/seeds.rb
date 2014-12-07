require 'faker'

User.delete_all
Restaurant.delete_all
Reservation.delete_all
Star.delete_all
Category.delete_all

# Generate Patron flavored Users
100.times do
  User.create!({
    email: Faker::Internet.email,
    password: "password",
    role: "patron"
  })
end

# Generate Owner flavored Users
20.times do 
  User.create!({
    email: Faker::Internet.email,
    password: "password",
    role: "owner"
  })
end

16.times do
  c = Category.new({
    name: Faker::Hacker.noun
  })
  if c.valid?
    c.save
  else
    c.name = Faker::Hacker.noun
  end
end

# Genreate Restaurants
80.times do
  Restaurant.create!({
    name: Faker::Company.name,
    description: Faker::Lorem.sentence,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    postal_code: Faker::Address.postcode,
    phone: Faker::PhoneNumber.phone_number,
    web: Faker::Internet.url,
    owner_id: User.where(role: "owner").pluck(:id).sample,
    categories: Category.order("RANDOM()").all[2..4]
  })
end

# Generate Reservations
50.times do
  Reservation.create!({
    confirmed: false,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    date_time: Faker::Time.between(30.days.ago, Time.now + 30.days, :evening),
    restaurant_id: Restaurant.pluck(:id).sample,
    patron_id: User.where(role: "patron").pluck(:id).sample
  })
end

# Make some stars
100.times do
  Star.create!({
    fan_id: User.where(role:"patron").pluck(:id).sample,
    restaurant_id: Restaurant.pluck(:id).sample
  })
end