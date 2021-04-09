# frozen_string_literal: true

class User < ApplicationRecord
  attribute :name
  attribute :username
  attribute :admin, :boolean, default: false

  has_secure_password

  validates :name, :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { within: 8..72 }, allow_nil: true
end
