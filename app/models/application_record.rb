# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_paper_trail

  def self.permissions(is_admin)
    [:view, (%i[create update destroy] if is_admin)]
  end
end
