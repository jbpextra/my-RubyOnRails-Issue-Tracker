require 'omniauth'

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '608876360124-66un7b0fjv4j8c90qub80jj94vamric9.apps.googleusercontent.com', 'zz7m8TXrid6fs_uG0pjgY3Ic', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end