# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(first_name: 'Ziqiang', last_name: 'Shi', email: 'a@a', password: 'a', password_confirmation: 'a',
	nFollowing: 2, nFollower: 2, nPost: 2, nSold: 0, image: File.open("#{Rails.root}/public/images/user1.jpg"))
u2 = User.create(first_name: 'Shijian', last_name: 'Zheng', email: 'b@b', password: 'b', password_confirmation: 'b',
	nFollowing: 2, nFollower: 2, nPost: 2, nSold: 0, image: File.open("#{Rails.root}/public/images/user2.jpg"))
u3 = User.create(first_name: 'Kai', last_name: 'Wang', email: 'c@c', password: 'c', password_confirmation: 'c',
	nFollowing: 2, nFollower: 2, nPost: 2,  nSold: 0, image: File.open("#{Rails.root}/public/images/user3.jpg"))
u4 = User.create(first_name: 'Yu', last_name: 'Xie', email: 'd@d', password: 'd', password_confirmation: 'd',
	nFollowing: 2, nFollower: 2, nPost: 2,  nSold: 0, image: File.open("#{Rails.root}/public/images/user4.jpg"))

Friendship.create(user_id: u1.id, friend_id: u2.id)
Friendship.create(user_id: u1.id, friend_id: u3.id)
Friendship.create(user_id: u2.id, friend_id: u3.id)
Friendship.create(user_id: u2.id, friend_id: u4.id)
Friendship.create(user_id: u3.id, friend_id: u4.id)
Friendship.create(user_id: u3.id, friend_id: u1.id)
Friendship.create(user_id: u4.id, friend_id: u1.id)
Friendship.create(user_id: u4.id, friend_id: u2.id)

p1 = Post.create(title: 'chair', description: 'This is the best second-handed chair!',
	price: 10, user_id: u1.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/chair.jpg"))
p2 = Post.create(title: 'table', description: 'This is the best second-handed table!',
	price: 20, user_id: u1.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/table.jpg"))
p3 = Post.create(title: 'lamp', description: 'This is the best second-handed lamp!',
	price: 15, user_id: u2.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/lamp.jpg"))
p4 = Post.create(title: 'mattress', description: 'This is the most soft second-handed mattress!',
	price: 80, user_id: u2.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/mattress.jpg"))
p5 = Post.create(title: 'bike', description: 'This is the coolest second-handed bike!',
	price: 100, user_id: u3.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/bike.jpg"))
p6 = Post.create(title: 'car', description: 'This is the best second-handed car!',
	price: 1000, user_id: u3.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/car.jpg"))
p7 = Post.create(title: 'superman', description: 'This is the most handsome second-handed superman!',
	price: 8888, user_id: u4.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/superman.jpeg"))
p8 = Post.create(title: 'iphone', description: 'This is broken second-handed iphone!',
	price: 50, user_id: u4.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/iphone.jpg"))


Comment.create(commender_id: 1, body: 'Buy the chair!', post_id: p1.id)
Comment.create(commender_id: 4, body: 'The chair looks so old.', post_id: p1.id)
Comment.create(commender_id: 2, body: 'Come buy my lamp!', post_id: p3.id)
Comment.create(commender_id: 1, body: 'What a ugly lamp.', post_id: p3.id)
Comment.create(commender_id: 3, body: 'My bike is so cool!', post_id: p5.id)
Comment.create(commender_id: 2, body: 'I like it.', post_id: p5.id)
Comment.create(commender_id: 4, body: 'It still works even it is broken.', post_id: p7.id)
Comment.create(commender_id: 3, body: 'Keep it for me.', post_id: p7.id)
