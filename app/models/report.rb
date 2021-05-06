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

  validates :interviewee, :resides_since, :full_text, :full_text_md, :address, :interview_date,
            presence: true

  def name
    "Entrevista com #{interviewee.split.first} em #{I18n.l interview_date}"
  end
end
