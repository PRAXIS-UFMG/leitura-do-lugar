Clearance.configure do |config|
  config.routes = false
  config.allow_sign_up = false
  config.cookie_expiration = lambda { |_| 1.week.from_now.utc }
  config.cookie_path = "/admin/"
  # config.routes = false
  config.mailer_sender = "ti@praxis.arq.ufmg.br"
  config.redirect_url = "/admin/"
  config.rotate_csrf_on_sign_in = true
  config.same_site = nil
  config.secure_cookie = true
  config.signed_cookie = true
  config.parent_controller = "Admin::ApplicationController"
end
