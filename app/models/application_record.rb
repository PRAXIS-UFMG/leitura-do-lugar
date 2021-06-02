# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include MarkdownArticleConcern
  include MediaConcern

  has_paper_trail

  def self.lowercase_human_name
    model_name.human.downcase
  end

  def self.human_title_name
    model_name.human.capitalize
  end
end
