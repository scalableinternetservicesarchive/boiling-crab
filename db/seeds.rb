# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Dish.create(name: 'Shrimp', image_url: 'http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach01.jpg', description: 'The shrimp is good!', price: 1.5)
Dish.create(name: 'Crab', image_url: 'http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach02.jpg', description: 'The crab is wondeful!', price: 2.0)