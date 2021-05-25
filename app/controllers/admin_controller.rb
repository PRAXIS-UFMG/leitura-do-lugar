# frozen_string_literal: true

class AuthenticationError < StandardError
  def message
    "#{current_user.name} is not allowed to #{action_name} #{controller_path.classify}"
  end
end

class AdminController < ApplicationController
  include Authentication

  layout "admin"
  before_action :set_paper_trail_whodunnit
  helper_method :current_user
  rescue_from AuthenticationError, with: :redirect_to_root

  private

  # @return [User]
  def current_user
    @current_user ||= User.find(session["user_id"])
  rescue ActiveRecord::RecordNotFound => e
    session.delete "user_id"
    raise AuthenticationError
  end

  def redirect_to_root
    redirect_to root_url
  end
end
