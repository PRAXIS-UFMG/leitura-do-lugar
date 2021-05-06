# frozen_string_literal: true

class LineAnalysesController < AdminController
  before_action :set_line_analysis, only: %i[show edit update destroy]

  # GET /line_analyses
  def index
    @line_analyses = LineAnalysis.all
    render CollectionIndexComponent.new LineAnalysis, @line_analyses, :'document-add',
                                        name:      { header: 'w-56' },
                                        line_type: { header: 'w-24', cell: 'text-sm uppercase' }
  end

  # GET /line_analyses/1
  def show
    render ModelViewComponent.new @line_analysis, :name, :line_type, :objective, :description_md
  end

  # GET /line_analyses/new
  def new
    @line_analysis = LineAnalysis.new
    render render_form
  end

  # GET /line_analyses/1/edit
  def edit
    render render_form
  end

  # POST /line_analyses
  def create
    @line_analysis = LineAnalysis.new(line_analysis_params)

    if @line_analysis.save
      redirect_to @line_analysis, notice: t('notice.created', model: LineAnalysis.lowercase_human_name)
    else
      render render_form, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /line_analyses/1
  def update
    if @line_analysis.update(line_analysis_params)
      redirect_to @line_analysis, notice: t('notice.updated', model: LineAnalysis.lowercase_human_name)
    else
      render render_form, status: :unprocessable_entity
    end
  end

  # DELETE /line_analyses/1
  def destroy
    @line_analysis.destroy
    redirect_to line_analyses_url, notice: t('notice.destroyed', model: LineAnalysis.lowercase_human_name)
  end

  private

  def render_form
    ModelFormComponent.new @line_analysis, :name,
                           :name, line_type: { as: :enum }, objective: {}, description: {}
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_line_analysis
    @line_analysis = LineAnalysis.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def line_analysis_params
    params.require(:line_analysis).permit(:name, :line_type, :objective, :description, :description_md)
  end
end
