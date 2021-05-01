# frozen_string_literal: true

class Report < ApplicationRecord
  attribute :interviewee
  attribute :resides_since, :integer
  attribute :full_text
  attribute :address
  attribute :addr_lat, :float
  attribute :addr_lon, :float
  attribute :interview_date, :date
  attribute :approved, :boolean

  def permissions(user)
    super(user) + [:create]
  end

  def name
    "Entrevista com #{interviewee.split.first} em #{I18n.l interview_date}"
  end
end
