# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, Rails.application.credentials[:VK_KEY],
           Rails.application.credentials[:VK_SECRET]
  provider :facebook, Rails.application.credentials[:FB_KEY],
           Rails.application.credentials[:FB_SECRET]
end
