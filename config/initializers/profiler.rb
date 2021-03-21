# frozen_string_literal: true

if Rails.env.dev?
  Rack::MiniProfiler.config.position     = 'bottom-right'
  Rack::MiniProfiler.config.start_hidden = true
end
