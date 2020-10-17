# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Restaurant.destroy_all
Meal.destroy_all

puts 'Creating users…'
10.times do
  restaurateur = User.new(
    email: Faker::Internet.safe_email,
    password: "12345678",
    username: Faker::Company,
  )
restaurateur.save!
 Restaurant.create(user_id: restaurateur.id, name: Faker::Restaurant.name, category: Faker::Restaurant.type, adress: Faker::Address.street_address)

end

puts 'Done!'



