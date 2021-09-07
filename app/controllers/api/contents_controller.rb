class Api::ContentsController < Api::ApplicationController
  def show
    render json: Content.includes(:article).find_by!(slug: params[:slug])
  end
end
