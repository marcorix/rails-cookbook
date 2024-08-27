require "json"
require "open-uri"

puts "Cleaning the DB"
Bookmark.destroy_all
Recipe.destroy_all
Category.destroy_all

puts "Creating recipes..."

# Recipe.create!(
#   name: "Spaghetti Carbonara",
#   description: "A 'true Italian' carbonara recipe, it's ready in about 30 minutes.There is no cream....",
#   image_url: "https://www.allrecipes.com/thmb/CKRPG_da4wLz3j0pYv0e2jDdF6A=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4499842-257380-AR-spaghetti-alla-carbonara-tradizionali-buckwheat-queen-4x3-eb4e48956fbd4277adcc3556e3bf6ecc.jpg",
#   rating: 4.8
# )

# Recipe.create!(
#   name: "Green Goddess Salad",
#   description: "Combine spinach, parsley, basil,chives, tarragon, shallot, garlic,anchovy paste, and lime juicein a high-powered blender;blend and slowly",
#   image_url: "https://www.allrecipes.com/thmb/M9vZZBM1RLwFrisYyiXYyFlgv_0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Green_Goddess_Dressing_4x3-STEP_060-9f2282f3c8a745508e5da1c2777a51c6.jpg",
#   rating: 3.8
# )

# Recipe.create!(
#   name: "Beef Miso Ramen",
#   description: "Combine steak and soy sauce in a plastic container with a lid. For best flavor results, marinate in the refrigerator for 2 hours....",
#   image_url: "https://www.allrecipes.com/thmb/_7xd4kS366bm0oHubdEb6r3jXjo=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/9020363-860f0064b2054217a473ed81737e2483.jpg",
#   rating: 4.5
# )

# Recipe.create!(
#   name: "Homemade Sushi Rolls",
#   description: "Put rice into a large deep bowl. Fill with cold water and rub rice together with hands until water turns milky white. Drain cloudy water, being careful not to pour out rice...",
#   image_url: "https://www.allrecipes.com/thmb/uSEAL4PIbIU0ShT9UdSQdZA0POs=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8536667-you-can-make-sushi-rolls-4x3-1-6ba19ffc7e494df88b2e0cd50956d4e8.jpg",
#   rating: 4.7
# )

def recipe_builder(id)
    meal_url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
    meal_serialized = URI.open(meal_url).read
    meal = JSON.parse(meal_serialized )["meals"][0]
    puts "Creating #{meal["strMeal"]}"

    Recipe.create!(
      name: meal["strMeal"],
      description: meal["strInstructions"],
      image_url: meal["strMealThumb"],
      rating: rand(3..5.0).round(1)
    )
end

categories = ["Breakfast", "Pasta", "Seafood", "Dessert"]

categories.each do |category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
  recipe_list = URI.open(url).read
  recipes = JSON.parse(recipe_list)
  recipes["meals"].take(5).each do |recipe|
    recipe_builder(recipe["idMeal"])
  end
end

puts "Done! #{Recipe.count} recipes created!"
