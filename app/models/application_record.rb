# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_paper_trail

  def self.lowercase_human_name
    model_name.human.downcase
  end

  # @param [User] user
  def permissions(user)
    [:show, (%i[create update destroy] if user.admin?)].flatten
  end

  # @param [User] user
  # @param [:show,:create,:update,:destroy] action
  def permitted_to?(user, action)
    action.in? permissions(user)
  end
end
