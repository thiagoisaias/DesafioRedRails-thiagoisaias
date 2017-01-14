# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do |i|
  User.create(
    name: Faker::StarWars.character,
    email: Faker::Internet.email,
    password: 'password'
    )
end

users_list = User.all
users_list.each do |user|
  3.times do
    content = Faker::StarWars.quote
    user.posts.create(content: content)
  end
end

users = User.all
user = User.first
following = users[1..10]
followers = users[3..5]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }