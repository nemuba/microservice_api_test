# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'SerproService::Service' do
  let(:params) { { token: Faker::Alphanumeric.alpha(number: 10), document: Faker::IDNumber.brazilian_citizen_number } }

  describe '#respond_to' do
    it '.call' do
      expect(::SerproService::Service).to respond_to(:call)
    end

    it '.show' do
      expect(::SerproService::Service).to respond_to(:show)
    end
  end

  describe '#call' do
    it 'run call method' do
      expect { ::SerproService::Service.call(params) }.to change(Serpro, :count).by(1)
    end

    it 'start job' do
      ::SerproService::Service.call(params)
      expect(SerproJob).to have_enqueued_sidekiq_job(params[:token])
    end
  end

  describe '#show' do
    it 'run show method' do
      ::SerproService::Service.call(params)
      register = ::SerproService::Service.show(params)
      expect(register).to be_a(Serpro)
    end
  end
end
