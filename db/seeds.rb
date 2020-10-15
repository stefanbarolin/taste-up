# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user = User.create(email: "fatouamta@gmail.com", password: "123456")
10.times do
  Restaurant.create(user_id: user.id, name: Faker::Restaurant.name, category: Faker::Restaurant.type, adress: Faker::Address.street_address)
end
