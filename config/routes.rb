# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  post 'sepros', to: 'serpros#create'
  get 'serpros/result', to: 'serpros#show'
end
