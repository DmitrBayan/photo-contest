Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, ENV["VK_KEY"], ENV["VK_SECRET"]
  provider :facebook, ENV["FB_KEY"], ENV["FB_SECRET"]
end