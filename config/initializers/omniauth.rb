OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '473701529432821', '4a86c0c8c132a600c4687b32c5100142'
end