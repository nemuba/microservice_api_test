# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Serpro, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_presence_of(:document) }
    it { is_expected.to validate_uniqueness_of(:token) }
  end
end
