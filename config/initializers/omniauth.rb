Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, '7251431', 'z8WHZnOy4G1FvuUq9Lb0'
  provider :facebook, '448070755873557', '62eb16f667c965f266de63b72da68f39'
end