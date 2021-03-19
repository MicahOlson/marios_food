# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all

50.times do |i|
  product = Product.create!(name: Faker::Food.unique.ingredient, cost: rand(0.01..19.99), country_of_origin: Faker::Address.country)
  5.times do |i|
    Review.create!(author: Faker::FunnyName.unique.name, content_body: Faker::Lorem.paragraph(sentence_count: 4, random_sentences_to_add: 2), rating: rand(1..5), product_id: product.id)
  end
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
