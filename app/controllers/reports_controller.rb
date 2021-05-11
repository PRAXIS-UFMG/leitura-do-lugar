# frozen_string_literal: true

class ReportsController < AdminController
  before_action :set_report, only: %i[show edit update destroy]

  # GET /reports
  def index
    render CollectionIndexComponent.new Report, Report.all, :'document-add',
                                        interviewee: { header: 'w-56' },
                                        interview_date: { cell: 'text-center' },
                                        approved: { cell: 'text-right uppercase text-sm' }
  end

  # GET /reports/1
  def show
    render ModelViewComponent.new @report, :name,
                                  :resides_since, :interview_date, :address, :full_text_md, :approved
  end

  # GET /reports/new
  def new
    @report = Report.new
    render_report_form
  end

  # GET /reports/1/edit
  def edit
    render_report_form
  end

  # POST /reports
  def create
    @report = Report.new(report_params)

    if @report.save
      check_geocoding
      redirect_to @report, notice: I18n.t('notice.created', model: Report.lowercase_human_name)
    else
      render_report_form
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      check_geocoding
      redirect_to @report, notice: I18n.t('notice.updated', model: Report.lowercase_human_name)
    else
      render_report_form
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: 'Report was successfully destroyed.'
  end

  private

  def check_geocoding
    flash[:error] = I18n.t('activerecord.attributes.report.address.invalid') unless @report.geocoded?
  end

  def render_report_form
    render ModelFormComponent.new @report, :name,
                                  :interviewee, :resides_since, :interview_date, :approved, :address, :full_text
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:interviewee, :resides_since, :full_text, :full_text_md,
                                   :address, :addr_lat, :addr_lon, :interview_date, :approved)
  end
end
