Clearance.configure do |config|
  config.allow_sign_up = false
  config.cookie_expiration = lambda { |_| 1.week.from_now.utc }
  config.routes = false
  config.mailer_sender = "ti@leituradolugar.arq.br"
  config.redirect_url = "/admin"
  config.rotate_csrf_on_sign_in = true
  config.same_site = :strict
  config.sign_in_guards
  config.secure_cookie = Rails.env.production?
  config.signed_cookie = Rails.env.production?
end
