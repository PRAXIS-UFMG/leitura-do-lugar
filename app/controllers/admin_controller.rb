# frozen_string_literal: true

class AdminController < ApplicationController
  include Authentication

  layout 'admin'
  helper_method :current_user
  before_action :set_paper_trail_whodunnit

  def current_user
    return unless session['user_id']

    begin
      User.find(session['user_id'])
    rescue ActiveRecord::RecordNotFound => e
      reset_session
      raise e
    end
  end

  def permitted?(action)
    action.in? controller_path.classify.permissions(current_user&.admin)
  end
end
