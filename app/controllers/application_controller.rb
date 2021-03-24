# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :authenticated?, :current_user

  def authenticated?
    session['user_id'] != nil
  end

  def current_user
    User.find(session['user_id'])
  end
end
