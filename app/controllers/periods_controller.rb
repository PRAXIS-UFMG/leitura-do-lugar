# frozen_string_literal: true

class PeriodsController < AdminController
  before_action :set_period, only: %i[show edit update destroy]

  # GET /periods
  def index
    render CollectionIndexComponent.new Period, Period.all, :'document-add',
      name: {header: "w-72"},
      start_date: {header: "w-16 text-center"},
      end_date: {header: "w-16 text-center"}
  end

  # GET /periods/1
  def show
    render ModelViewComponent.new @period, :name, :start_date, :end_date, :article
  end

  # GET /periods/new
  def new
    @period = Period.new
    @period.build_article
    render "form"
  end

  # GET /periods/1/edit
  def edit
    render "form"
  end

  # POST /periods
  def create
    @period = Period.new(period_params)

    if @period.save
      redirect_to @period, notice: I18n.t("notice.created", model: Period.lowercase_human_name)
    else
      render "form"
    end
  end

  # PATCH/PUT /periods/1
  def update
    if @period.update(period_params)
      redirect_to @period, notice: I18n.t("notice.updated", model: Period.lowercase_human_name)
    else
      render "form"
    end
  end

  # DELETE /periods/1
  def destroy
    @period.destroy
    redirect_to periods_url, notice: I18n.t("notice.destroyed", model: Period.lowercase_human_name)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_period
    @period = Period.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def period_params
    params.require(:period).permit(:name, :start_date, :end_date, article_attributes: [:markdown, :rendered])
  end
end
