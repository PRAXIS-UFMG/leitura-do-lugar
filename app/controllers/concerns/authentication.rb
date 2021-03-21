# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate!
  end

  private

  def authenticate!
    return if session['user_id']

    redirect_to '/'
  end

  def current_user
    User.find(session['user_id'])
  end
end
