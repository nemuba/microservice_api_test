# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SerprosController, type: :controller do
  describe 'POST #create' do
    let(:params) do
      { serpro: { token: Faker::Alphanumeric.alpha(number: 10), document: Faker::IDNumber.brazilian_citizen_number } }
    end

    it 'returns http success' do
      post :create, params: params
      expect(response).to have_http_status(:success)
    end

    it 'create new register' do
      expect do
        post :create, params: params
      end.to change(Serpro, :count).by(1)
    end

    it 'Enqueue job' do
      # enqueue sidekiq job
      post :create, params: params

      expect(SerproJob).to have_enqueued_sidekiq_job(params[:serpro][:token])
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      serpro = create(:serpro)
      get :show, params: { token: serpro.token }
      expect(response).to have_http_status(:success)
    end
  end
end
