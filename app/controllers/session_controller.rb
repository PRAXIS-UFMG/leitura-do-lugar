# frozen_string_literal: true

class SessionController < ApplicationController
  include Authentication
  skip_before_action :authenticate!, only: %i[login create]

  def login; end

  def create
    user = User.find_by(username: session_params[:username])
    if user&.authenticate(session_params[:password])
      session['user_id'] = user.id
      return redirect_to :users
    end
    flash[:error] = 'Usuário ou senha incorretos'
    redirect_to :login
  end

  def logout
    flash[:notice] = "Sessão de #{current_user.username} terminada."
    reset_session
    redirect_to :login
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
