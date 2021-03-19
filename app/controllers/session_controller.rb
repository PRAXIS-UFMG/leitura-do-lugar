# frozen_string_literal: true

class SessionController < ApplicationController
  def login; end

  def logout; end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
