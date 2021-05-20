# frozen_string_literal: true

class LineAnalysis < ApplicationRecord
  enum line_type: {no: "no", do: "do"}

  attribute :name
  attribute :objective
  attribute :description
  attribute :description_md

  validates :name, uniqueness: true
  validates :line_type, :name, :objective, :description, :description_md,
    presence: true
end
