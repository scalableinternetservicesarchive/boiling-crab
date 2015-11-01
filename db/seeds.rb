# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(first_name: 'a', last_name: 'a', email: 'a@a', password: 'a', password_confirmation: 'a')
u2 = User.create(first_name: 'b', last_name: 'b', email: 'b@b', password: 'b', password_confirmation: 'b')
u3 = User.create(first_name: 'c', last_name: 'c', email: 'c@c', password: 'c', password_confirmation: 'c')
u4 = User.create(first_name: 'd', last_name: 'd', email: 'd@d', password: 'd', password_confirmation: 'd')

Post.create(title: 'aa', description: 'aa', price: 1, user_id: u1.id)
Post.create(title: 'aaa', description: 'aaa', price: 1, user_id: u1.id)
Post.create(title: 'bb', description: 'bb', price: 1, user_id: u2.id)
Post.create(title: 'bbb', description: 'bbb', price: 1, user_id: u2.id)
Post.create(title: 'cc', description: 'cc', price: 1, user_id: u3.id)
Post.create(title: 'ccc', description: 'ccc', price: 1, user_id: u3.id)
Post.create(title: 'dd', description: 'dd', price: 1, user_id: u4.id)
Post.create(title: 'ddd', description: 'ddd', price: 1, user_id: u4.id)