module ApplicationHelper
  def gravatar_avatar_url(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def twitter_avatar_url(handle)
    "https://twitter.com/api/users/profile_image/#{handle}"
  end

  def avatar_url(user, size = 64)
    return twitter_avatar_url(user.twitter_handle) if user.twitter_handle
    gravatar_avatar_url(user, size)
  end
end
