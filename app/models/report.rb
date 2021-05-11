# frozen_string_literal: true

class Report < ApplicationRecord
  attribute :interviewee
  attribute :resides_since, :integer
  attribute :full_text
  attribute :full_text_md
  attribute :address
  attribute :addr_lat, :float
  attribute :addr_lon, :float
  attribute :interview_date, :date
  attribute :approved, :boolean

  validates :interviewee, :resides_since, :full_text, :full_text_md, :address, :interview_date, presence: true

  geocoded_by :address, latitude: :addr_lat, longitude: :addr_lon
  after_validation :geocode, if: :address_changed?
  before_validation if: :address_changed? do
    self.addr_lat = nil
    self.addr_lon = nil
  end

  def name
    "Entrevista com #{interviewee.split.first} em #{I18n.l interview_date}"
  end
end
