# frozen_string_literal: true

class LineAnalysis < ApplicationRecord
  def self.permissions(is_admin)
    [:view, :create, (%i[update destroy] if is_admin)]
  end
end
