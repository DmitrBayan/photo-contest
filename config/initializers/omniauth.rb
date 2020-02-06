# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, Rails.application.credentials.aws[:VK_KEY],
           Rails.application.credentials.aws[:VK_SECRET]
  provider :facebook, Rails.application.credentials.aws[:FB_KEY],
           Rails.application.credentials.aws[:FB_SECRET]
end
