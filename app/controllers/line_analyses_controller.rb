# frozen_string_literal: true

class LineAnalysesController < AdminController
  before_action :set_line_analysis, only: %i[show edit update destroy]

  # GET /line_analyses
  def index
    @line_analyses = LineAnalysis.all
    render CollectionIndexComponent.new LineAnalysis, @line_analyses, :'document-add',
                                        name: { header: 'w-56' }, line_type: { header: 'w-16', cell: 'uppercase' }
  end

  # GET /line_analyses/1
  def show
    render ModelViewComponent.new model: @line_analysis
  end

  # GET /line_analyses/new
  def new
    @line_analysis = LineAnalysis.new
    render ModelFormComponent.new model: @line_analysis
  end

  # GET /line_analyses/1/edit
  def edit
    render ModelFormComponent.new model: @line_analysis
  end

  # POST /line_analyses
  def create
    @line_analysis = LineAnalysis.new(line_analysis_params)

    if @line_analysis.save
      redirect_to @line_analysis, notice: 'Line analysis was successfully created.'
    else
      flash[:error] = @line_analysis.errors.full_messages
      render ModelFormComponent.new(model: @line_analysis), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /line_analyses/1
  def update
    if @line_analysis.update(line_analysis_params)
      redirect_to @line_analysis, notice: 'Line analysis was successfully updated.'
    else
      flash[:error] = @line_analysis.errors.full_messages
      render ModelFormComponent.new(model: @line_analysis), status: :unprocessable_entity
    end
  end

  # DELETE /line_analyses/1
  def destroy
    @line_analysis.destroy
    redirect_to line_analyses_url, notice: 'Line analysis was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_analysis
    @line_analysis = LineAnalysis.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def line_analysis_params
    params.require(:line_analysis).permit(:name, :line_type, :objective, :description)
  end
end
