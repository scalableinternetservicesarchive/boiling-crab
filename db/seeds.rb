# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(first_name: 'a', last_name: 'a', email: 'a@a', password: 'a', password_confirmation: 'a', nFollowing: 1, nFollower: 1, nPost: 2)
u2 = User.create(first_name: 'b', last_name: 'b', email: 'b@b', password: 'b', password_confirmation: 'b', nFollowing: 1, nFollower: 1, nPost: 2)
u3 = User.create(first_name: 'c', last_name: 'c', email: 'c@c', password: 'c', password_confirmation: 'c', nFollowing: 1, nFollower: 1, nPost: 2)
u4 = User.create(first_name: 'd', last_name: 'd', email: 'd@d', password: 'd', password_confirmation: 'd', nFollowing: 1, nFollower: 1, nPost: 2)

Friendship.create(user_id: 1, friend_id: 2)
Friendship.create(user_id: 2, friend_id: 3)
Friendship.create(user_id: 3, friend_id: 4)
Friendship.create(user_id: 4, friend_id: 1)

p1 = Post.create(title: 'aa', description: 'aa', price: 1, user_id: u1.id)
p2 = Post.create(title: 'aaa', description: 'aaa', price: 1, user_id: u1.id)
p3 = Post.create(title: 'bb', description: 'bb', price: 1, user_id: u2.id)
p4 = Post.create(title: 'bbb', description: 'bbb', price: 1, user_id: u2.id)
p5 = Post.create(title: 'cc', description: 'cc', price: 1, user_id: u3.id)
p6 = Post.create(title: 'ccc', description: 'ccc', price: 1, user_id: u3.id)
p7 = Post.create(title: 'dd', description: 'dd', price: 1, user_id: u4.id)
p8 = Post.create(title: 'ddd', description: 'ddd', price: 1, user_id: u4.id)

Comment.create(commender_id: 1, body: 'aaaaaaaaa', post_id: 1)
Comment.create(commender_id: 4, body: 'ddddddddd', post_id: 1)
Comment.create(commender_id: 2, body: 'bbbbbbbbb', post_id: 3)
Comment.create(commender_id: 1, body: 'aaaaaaaaa', post_id: 3)
Comment.create(commender_id: 3, body: 'ccccccccc', post_id: 5)
Comment.create(commender_id: 2, body: 'bbbbbbbbb', post_id: 5)
Comment.create(commender_id: 4, body: 'ddddddddd', post_id: 7)
Comment.create(commender_id: 3, body: 'ccccccccc', post_id: 7)
