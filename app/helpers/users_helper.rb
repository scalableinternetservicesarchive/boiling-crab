module UsersHelper
  def cache_key_for_feed_post
    "feed-post-#{Post.maximum(:updated_at)}-#{Comment.maximum(:updated_at)}"
  end
end
