# frozen_string_literal: true

class LineAnalysis < ApplicationRecord
  enum line_type: { no: 'no', do: 'do' }
  attribute :name
  attribute :objective
  attribute :description

  validates :name, uniqueness: true
  validates :line_type, :name, :objective, :description, presence: true

  def self.permissions(is_admin)
    [:view, :create, (%i[update destroy] if is_admin)]
  end
end
