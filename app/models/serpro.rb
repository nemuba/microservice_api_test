# frozen_string_literal: true

# Serpro model
class Serpro < ApplicationRecord
  enum status: { pending: 0, success: 1, error: 2 }

  validates :token, presence: true
  validates :token, uniqueness: true
  validates :document, presence: true
end
