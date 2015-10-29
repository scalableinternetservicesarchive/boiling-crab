# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Dish.delete_all
Dish.create(name: 'Shrimp', description: 'The shrimp is good!', price: 1.5)
Dish.create(name: 'Crab', description: 'The crab is wondeful!', price: 2.0)