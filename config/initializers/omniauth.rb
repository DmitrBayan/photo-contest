# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, Rails.application.credentials[Rails.env.to_sym][:VK_KEY],
           Rails.application.credentials[Rails.env.to_sym][:VK_SECRET]
  provider :facebook, Rails.application.credentials[Rails.env.to_sym][:FB_KEY],
           Rails.application.credentials[Rails.env.to_sym][:FB_SECRET]
end
