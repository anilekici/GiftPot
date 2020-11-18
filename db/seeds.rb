# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying all your precious gifts"
Gift.destroy_all
puts "deleting pots"
Pot.destroy_all
puts "deleting users"
User.destroy_all
puts "destroyin all users pots"
UsersPot.destroy_all

puts "creating users"
20.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )
end


puts "creating pots"
5.times do
  Pot.create!(
      owner: User.all.sample,
      name: Faker::Movies::StarWars.character,
      description: Faker::Quote.yoda,
  )
end


puts "creating gifts"
18.times do
  Gift.create!(
      pot: Pot.all.sample,
  )
end

puts "creating users pots"
30.times do
  UsersPot.create!(
    user: User.all.sample,
    pot: Pot.all.sample,
  )
end
