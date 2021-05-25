# frozen_string_literal: true

class Period < ApplicationRecord
  attribute :name
  attribute :start_date, :date
  attribute :end_date, :date

  include MarkdownText

  validates :name, :start_date, :end_date, :markdown, :rendered, presence: true
end
