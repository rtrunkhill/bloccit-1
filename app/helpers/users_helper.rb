module UsersHelper
  def user_has_posts_or_comments?
      current_user && (current_user.posts.count > 0 || current_user.comments.count > 0)
  end

  def user_has_favorites?
     current_user && current_user.favorites.count > 0
  end
end
