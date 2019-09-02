# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

gender = [ 'Male', 'Female' ]

5.times do
  user = Api::User.new()
  user.name = Faker::Name.unique.name
  user.website = Faker::Internet.email(name: user.name)
  user.address = Faker::Address.full_address
  user.city = Faker::Address.city
  user.phone_number = Faker::PhoneNumber.cell_phone
  user.gender = gender.sample
  
  if user.save!
    puts "created"
  end

end