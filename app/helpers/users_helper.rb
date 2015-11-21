module UsersHelper
  def cache_key_for_feed_post
    "feed-post-#{Post.maximum(:updated_at)}-#{Comment.maximum(:updated_at)}"
  end
  def cache_key_for_follower_user(user)
    "follower-user-#{user.id}"
  end
  def cache_key_for_following_user(user)
    "following-user-#{user.id}"
  end
end
