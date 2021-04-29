# frozen_string_literal: true

class AdminController < ApplicationController
  include Authentication

  layout 'admin'
  before_action :set_paper_trail_whodunnit
  helper_method :current_user

  # @return [User]
  def current_user
    @current_user ||= User.find(session['user_id'])
  rescue ActiveRecord::RecordNotFound => e
    reset_session
    raise e
  end

  class AuthorizationError < StandardError
    def message
      "#{current_user.name} is not allowed to #{action_name} #{controller_path.classify}"
    end
  end

  def permitted?(action)
    action.in? controller_path.classify.permissions(current_user)
  end
end
