class Api::ExcerptsController < Api::ApplicationController
  def index
    @excerpts = Excerpt.joins(:report).where(approved: true, reports: {approved: true}).includes(:report)
  end
end
