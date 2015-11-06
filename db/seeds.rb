# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(first_name: 'Ziqiang', last_name: 'Shi', email: 'a@a', password: 'a', password_confirmation: 'a',
	nFollowing: 1, nFollower: 1, nPost: 2, image: 'http://ccgexpo.cn/ckeditor_assets/pictures/000/000/253/content_image007.jpg')
u2 = User.create(first_name: 'Shijian', last_name: 'Zheng', email: 'b@b', password: 'b', password_confirmation: 'b',
	nFollowing: 1, nFollower: 1, nPost: 2, image: 'http://img9.dzdwl.com/img/11759906_152609217127_2.jpg')
u3 = User.create(first_name: 'Kai', last_name: 'Wang', email: 'c@c', password: 'c', password_confirmation: 'c',
	nFollowing: 1, nFollower: 1, nPost: 2, image: 'http://wyxgroup-img.stor.appsina.com/9e2acb4f9f404a4b088a1d7c81583d54.jpg')
u4 = User.create(first_name: 'Yu', last_name: 'Xie', email: 'd@d', password: 'd', password_confirmation: 'd',
	nFollowing: 1, nFollower: 1, nPost: 2, image: 'http://www.80ktv.net/cs/uploads/allimg/130926/103G32L6-2.jpg')

Friendship.create(user_id: u1.id, friend_id: u2.id)
Friendship.create(user_id: u1.id, friend_id: u3.id)
Friendship.create(user_id: u2.id, friend_id: u3.id)
Friendship.create(user_id: u2.id, friend_id: u4.id)
Friendship.create(user_id: u3.id, friend_id: u4.id)
Friendship.create(user_id: u3.id, friend_id: u1.id)
Friendship.create(user_id: u4.id, friend_id: u1.id)
Friendship.create(user_id: u4.id, friend_id: u2.id)

p1 = Post.create(title: 'chair', description: 'This is the best second-handed chair!',
	price: 10, user_id: u1.id, sell_to: -1, image: 'https://martinclemens.files.wordpress.com/2009/03/magnussen-edge-wood-desk-chair-chair_0_0.jpg')
p2 = Post.create(title: 'table', description: 'This is the best second-handed table!',
	price: 20, user_id: u1.id, sell_to: -1, image: 'http://st.hzcdn.com/simgs/74e1b7e70245dc09_4-5066/rustic-coffee-tables.jpg')
p3 = Post.create(title: 'lamp', description: 'This is the best second-handed lamp!',
	price: 15, user_id: u2.id, sell_to: -1, image: 'http://www.incrediblethings.com/wp-content/uploads/2012/06/dog-pooping-lamp-1.jpg')
p4 = Post.create(title: 'mattress', description: 'This is the most soft second-handed mattress!',
	price: 80, user_id: u2.id, sell_to: -1, image: 'http://maximmattress.com/storage/mattress3.jpg')
p5 = Post.create(title: 'bike', description: 'This is the coolest second-handed bike!',
	price: 100, user_id: u3.id, sell_to: -1, image: 'http://uncrate.com/p/2014/03/rungu-juggernaut-bike.jpg')
p6 = Post.create(title: 'car', description: 'This is the best second-handed car!',
	price: 1000, user_id: u3.id, sell_to: -1, image: 'http://blog.automart.co.za/wp-content/uploads/2014/07/Second-hand-cars-for-sale-1024x768.jpg')
p7 = Post.create(title: 'superman', description: 'This is the most handsome second-handed superman!',
	price: 8888, user_id: u4.id, sell_to: -1, image: 'http://cdn.blogosfere.it/nuvoleparlanti/images/Superman-Returns-Brandon-Routh.jpeg')
p8 = Post.create(title: 'iphone', description: 'This is broken second-handed iphone!',
	price: 50, user_id: u4.id, sell_to: -1, image: 'http://www.techlicious.com/images/phones/broken-iphone-editorial-only-510px.jpg')


Comment.create(commender_id: 1, body: 'Buy the chair!', post_id: p1.id)
Comment.create(commender_id: 4, body: 'The chair looks so old.', post_id: p1.id)
Comment.create(commender_id: 2, body: 'Come buy my lamp!', post_id: p3.id)
Comment.create(commender_id: 1, body: 'What a ugly lamp.', post_id: p3.id)
Comment.create(commender_id: 3, body: 'My bike is so cool!', post_id: p5.id)
Comment.create(commender_id: 2, body: 'I like it.', post_id: p5.id)
Comment.create(commender_id: 4, body: 'It still works even it is broken.', post_id: p7.id)
Comment.create(commender_id: 3, body: 'Keep it for me.', post_id: p7.id)
