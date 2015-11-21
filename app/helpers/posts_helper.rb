module PostsHelper
  def cache_key_for_post_row(post)
    "post-#{post.id}-#{post.updated_at}-#{post.comments.count}"
  end
  def cache_key_for_post_comments(post)
    "post-comments-#{post.comments.maximum(:updated_at)}-#{post.comments.count}"
  end
end
