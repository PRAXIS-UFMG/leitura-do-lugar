# frozen_string_literal: true

class LineAnalysesController < AdminController
  before_action :set_line_analysis, only: %i[show edit update destroy]

  # GET /line_analyses
  def index
    @line_analyses = LineAnalysis.all
  end

  # GET /line_analyses/1
  def show
  end

  # GET /line_analyses/new
  def new
    @line_analysis = LineAnalysis.new
    @line_analysis.build_article
    render "form"
  end

  # GET /line_analyses/1/edit
  def edit
    render "form"
  end

  # POST /line_analyses
  def create
    @line_analysis = LineAnalysis.new(line_analysis_params)

    if @line_analysis.save
      redirect_to @line_analysis, notice: t("notice.created", model: LineAnalysis.lowercase_human_name)
    else
      render "form", status: :unprocessable_entity
    end
  end

  # PATCH/PUT /line_analyses/1
  def update
    if @line_analysis.update(line_analysis_params)
      redirect_to @line_analysis, notice: t("notice.updated", model: LineAnalysis.lowercase_human_name)
    else
      render render_form, status: :unprocessable_entity
    end
  end

  # DELETE /line_analyses/1
  def destroy
    @line_analysis.destroy
    redirect_to line_analyses_url, notice: t("notice.destroyed", model: LineAnalysis.lowercase_human_name)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_analysis
    @line_analysis = LineAnalysis.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def line_analysis_params
    params.require(:line_analysis).permit(:name, :line_type, :objective, article_attributes: [:markdown, :rendered])
  end
end
