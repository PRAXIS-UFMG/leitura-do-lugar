class ExcerptsController < AdminController
  include WithErrorFlash
  before_action :set_excerpt, only: [:show, :edit, :update, :destroy]

  # GET /excerpts
  def index
    @excerpts = Excerpt.all
  end

  # GET /excerpts/1
  def show
  end

  # GET /excerpts/new
  def new
    @excerpt           = Excerpt.new
    @excerpt.report_id = params[:report]
    @excerpt.text      = params[:text].presence || @excerpt.report.markdown
  end

  # GET /excerpts/1/edit
  def edit

  end

  # POST /excerpts
  def create
    @excerpt = Excerpt.new(excerpt_params)

    if @excerpt.save
      redirect_to @excerpt, notice: "Excerpt was successfully created."
    else
      render 'form'
    end
  end

  # PATCH/PUT /excerpts/1
  def update
    if @excerpt.update(excerpt_params)
      redirect_to @excerpt, notice: "Excerpt was successfully updated."
    else
      render 'form'
    end
  end

  # DELETE /excerpts/1
  def destroy
    @excerpt.destroy
    redirect_to excerpts_url, notice: "Excerpt was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_excerpt
    @excerpt = Excerpt.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def excerpt_params
    params.require(:excerpt).permit(:report_id, :text, :approved, media_ids: [])
  end
end
