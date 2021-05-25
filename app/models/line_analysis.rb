# frozen_string_literal: true

class LineAnalysis < ApplicationRecord
  enum line_type: { no: "no", do: "do" }

  attribute :name
  attribute :objective

  include MarkdownText

  validates :name, uniqueness: true
  validates :line_type, :name, :objective,
            presence: true
end
