class Api::ContentsController < ActionController::API
  def show
    render json: Content.includes(:article).find_by!(slug: params[:slug])
  end
end
