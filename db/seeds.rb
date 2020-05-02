require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
puts "clearing the database.."
Ingredient.destroy_all
puts "creating ingredients"
ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |ele|
  Ingredient.create(name:ele["strIngredient1"])
end

puts "i am done making ingredients"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
