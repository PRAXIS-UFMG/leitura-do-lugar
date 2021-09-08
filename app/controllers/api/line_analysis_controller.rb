class Api::LineAnalysisController < Api::ApplicationController
  def index
    render json: LineAnalysis.all
  end
end
