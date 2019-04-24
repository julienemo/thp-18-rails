# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
puts "previous data cleared"
100.times do
  Movie.create(name: Faker::Book.title, genre: ["action", "horreur", "comédie", "drame"].sample, year: rand(1900...2020), director: Faker::Name.name, synopsis:Faker::Lorem.sentence, allocine_rating: rand(0.00...5.00).round(1) , already_seen: false)
end

puts "100 fakes movies created"
