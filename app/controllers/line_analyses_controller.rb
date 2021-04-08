# frozen_string_literal: true

class LineAnalysesController < AdminController
  before_action :set_line_analysis, only: %i[show edit update destroy]

  # GET /line_analyses
  def index
    @line_analyses = LineAnalysis.all
  end

  # GET /line_analyses/1
  def show; end

  # GET /line_analyses/new
  def new
    @line_analysis = LineAnalysis.new
  end

  # GET /line_analyses/1/edit
  def edit; end

  # POST /line_analyses
  def create
    @line_analysis = LineAnalysis.new(line_analysis_params)

    if @line_analysis.save
      redirect_to @line_analysis, notice: 'Line analysis was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /line_analyses/1
  def update
    if @line_analysis.update(line_analysis_params)
      redirect_to @line_analysis, notice: 'Line analysis was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /line_analyses/1
  def destroy
    @line_analysis.destroy
    format.html { redirect_to line_analyses_url, notice: 'Line analysis was successfully destroyed.' }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_analysis
    @line_analysis = LineAnalysis.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def line_analysis_params
    params.require(:line_analysis).permit(:name, :type, :objective, :description)
  end
end
