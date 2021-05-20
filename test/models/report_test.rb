# frozen_string_literal: true

require "test_helper"

class ReportTest < ActiveSupport::TestCase
  test "geocoding" do
    report = reports :one
    report.geocode

    assert_in_delta(-19.923688, report.addr_lat, 0.005)
    assert_in_delta(-43.9355013, report.addr_lon, 0.005)
  end
end
