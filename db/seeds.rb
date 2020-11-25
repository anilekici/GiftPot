# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying all messages"
Message.destroy_all
puts "destroying all chatrooms"
Chatroom.destroy_all
puts "destroying all your votes"
GiftVote.destroy_all
puts "destroying all your precious gifts"
Gift.destroy_all
puts "destroyin all users pots"
UsersPot.destroy_all
puts "destroying all contributions"
Contribution.destroy_all
puts "deleting pots"
Pot.destroy_all
puts "deleting users"
User.destroy_all






puts "creating users"
20.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )
end


puts "creating pots"
5.times do
  name = Faker::Movies::StarWars.character
  Pot.create!(
    owner: User.all.sample,
    name: name,
    description: Faker::Quote.yoda,
    end_date: "20 Dec 2020",
    chatroom: Chatroom.create(name: "#{name}'s Chatroom")
  )
end

puts "creating users pots"
10.times do
  UsersPot.create!(
    user: User.all.sample,
    pot: Pot.all.sample,
  )
end

puts "creating gifts"
18.times do
  gift = Gift.create!(
    pot: Pot.all.sample,
    name: Faker::Game.platform,
  )
end


puts "creating gift votes"
def get_voting_user(gift)
  user = User.all.sample
  while user.has_voted?(gift)
    user = User.all.sample
  end
  user
end

18.times do
  gift = Gift.all.sample
  gift_vote = GiftVote.create!(
      gift: gift,
      user: get_voting_user(gift)
  )
end

anil = User.create!(
  email: "anil@anil.com",
  password: "123456",
  first_name: "Anil",
  last_name: "Ekici",
  nickname: "Anıl"
)

tj = User.create!(
  email: "tj@tj.com",
  password: "123456",
  first_name: "TJ",
  last_name: "Hollins",
  nickname: "TJ"
)

marta = User.create!(
  email: "marta@marta.com",
  password: "123456",
  first_name: "Marta",
  last_name: "Simas",
  nickname: "Marta"
)

ardy = User.create!(
  email: "ardy@ardy.com",
  password: "123456",
  first_name: "Ardy",
  last_name: "Ardy",
  nickname: "Ardy"
)
name = Faker::Movies::StarWars.character
Pot.create!(
  owner: anil,
  name: name,
  description: Faker::Quote.yoda,
  end_date: "20 Dec 2020",
  chatroom: Chatroom.create(name: "#{name}'s Chatroom"),
)

UsersPot.create!(
  user: tj,
  pot: Pot.last,
)
UsersPot.create!(
  user: marta,
  pot: Pot.last,
)
UsersPot.create!(
  user: ardy,
  pot: Pot.last,
)
