# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all
User.destroy_all

45.times do |i|
  product = Product.create!(name: Faker::Food.unique.ingredient, cost: rand(0.01..19.99), country_of_origin: Faker::Address.country)
  5.times do |i|
    Review.create!(author: Faker::FunnyName.unique.name, content_body: Faker::Quote.jack_handey, rating: rand(1..5), product_id: product.id)
  end
end

5.times do |i|
  product = Product.create!(name: Faker::Food.unique.ingredient, cost: rand(0.01..19.99), country_of_origin: "United States of America")
  5.times do |i|
    Review.create!(author: Faker::FunnyName.unique.name, content_body: Faker::Quote.jack_handey, rating: rand(1..5), product_id: product.id)
  end
end

15.times do |i|
  username = Faker::FunnyName.unique.name
  User.create!(username: username, email: "#{username.gsub(/\W/, '')}@email.com", password: "Password1!")
end

User.create!(username: "admin", email: "admin@marios.com", password: "Administrator1!", admin: true)

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
p "Created #{User.count - 1} users and 1 admin"
