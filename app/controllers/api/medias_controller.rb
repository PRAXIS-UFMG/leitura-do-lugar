class Api::MediasController < ApplicationController
  include Clearance::Controller

  def show
    media = Media.find_by! name: params[:name]
    disposition = params[:download].present? ? "attachment" : "inline"

    if media.owner&.try(:approved) == false && signed_out?
      return head :not_found
    end

    set_rack_response media.file.to_rack_response disposition: disposition
  end

  private

  def set_rack_response((status, headers, body))
    self.status = status
    self.headers.merge! headers
    self.response_body = body
  end
end
