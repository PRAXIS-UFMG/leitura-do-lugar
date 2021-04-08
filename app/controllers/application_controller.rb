# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :authenticated?, :current_user
  before_action :set_paper_trail_whodunnit

  def authenticated?
    session['user_id'] != nil
  end

  def current_user
    return unless session['user_id']

    begin
      User.find(session['user_id'])
    rescue ActiveRecord::RecordNotFound => e
      reset_session
      raise e
    end
  end
end
