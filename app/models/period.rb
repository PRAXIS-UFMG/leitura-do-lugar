# frozen_string_literal: true

class Period < ApplicationRecord
  attribute :name
  attribute :description
  attribute :description_md
  attribute :start_date, :date
  attribute :end_date, :date

  validates :name, :description, :description_md, :start_date, :end_date, presence: true
end
