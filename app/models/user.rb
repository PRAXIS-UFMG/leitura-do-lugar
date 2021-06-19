# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  attribute :name
  attribute :admin, :boolean, default: false

  validates :name,  presence: true
end
