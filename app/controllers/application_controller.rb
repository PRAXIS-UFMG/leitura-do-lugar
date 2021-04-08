# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :authenticated?

  def authenticated?
    session['user_id'] != nil
  end
end
