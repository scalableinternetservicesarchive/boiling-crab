module PostsHelper
  def cache_key_for_post_row(post)
    "post-#{post.id}-#{submission.updated_at}"
  end
end
