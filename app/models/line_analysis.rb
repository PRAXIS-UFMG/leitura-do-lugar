# frozen_string_literal: true

class LineAnalysis < ApplicationRecord
  enum line_type: {no: "no", do: "do"}

  attribute :name
  attribute :objective

  has_and_belongs_to_many :excerpts
  has_markdown_article

  validates :name, uniqueness: true
  validates :line_type, :name, :objective,
    presence: true
end
