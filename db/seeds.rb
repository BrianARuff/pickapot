# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  Recipe.create({ingredient_list: 'this is a recipe', instruction_list: 'this is a recipe', name: 'recipe name test', user_id: '1', description: 'this is a recipe description', image: 'http://localhost:3000/uploads/recipe/image/5/2.jpeg', category_id: 1})
end