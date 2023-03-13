# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :serpro do
    token { Faker::Alphanumeric.alpha(number: 10) }
    document { Faker::IDNumber.brazilian_citizen_number }
    status { 0 }
  end
end
