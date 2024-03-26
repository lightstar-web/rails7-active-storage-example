class User < ApplicationRecord
  # has_one_attached :avatar
   has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  def avatar_url(style: :small)
    puts "=======avatar url========="
    puts self.avatar
    return "" unless self.avatar.attached?

    Rails.application.routes.url_helpers.upload_path(self.avatar.blob.key, s: style)
  end
end
