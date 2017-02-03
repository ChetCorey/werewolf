# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# binding.pry

new_game = Game.create(difficulty: 2)

(1..7).to_a.each do |i|
  Player.create(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    game: new_game
  )
end
