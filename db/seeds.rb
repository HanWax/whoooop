# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
Review.destroy_all

whoopbar = Restaurant.create(name: "Whoop Bar", cuisine: "Drinks")
whoopbar.reviews.create(thoughts: "Awesome", rating: 5)
whoopbar.reviews.create(thoughts: "Cool", rating: 4)
whoopbar.reviews.create(thoughts: "Okay", rating: 3)
whoopbar.reviews.create(thoughts: "Below par", rating: 2)
whoopbar.reviews.create(thoughts: "Awful", rating: 1)

whoopburger = Restaurant.create(name: "Whoop Burger", cuisine: "American")
whoopburger.reviews.create(thoughts: "Awesome", rating: 5)
whoopburger.reviews.create(thoughts: "Cool", rating: 4)
whoopburger.reviews.create(thoughts: "Okay", rating: 3)
whoopburger.reviews.create(thoughts: "Below par", rating: 2)
whoopburger.reviews.create(thoughts: "Awful", rating: 1)

whoopsushi = Restaurant.create(name: "Whoop Sushi", cuisine: "Japanese")
whoopsushi.reviews.create(thoughts: "Awesome", rating: 5)
whoopsushi.reviews.create(thoughts: "Cool", rating: 4)
whoopsushi.reviews.create(thoughts: "Okay", rating: 3)
whoopsushi.reviews.create(thoughts: "Below par", rating: 2)
whoopsushi.reviews.create(thoughts: "Awful", rating: 1)
