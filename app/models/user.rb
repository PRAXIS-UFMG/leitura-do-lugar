# frozen_string_literal: true

class User < ApplicationRecord
  attribute :name
  attribute :username
  attribute :admin, :boolean, default: false

  has_secure_password
end
