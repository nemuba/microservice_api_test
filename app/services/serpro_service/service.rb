# frozen_string_literal: true

# SeproService
module SerproService
  class Service < ApplicationService
    include SerproService::Searchable
    include SerproService::Creator
    include SerproService::TokenValidate

    attr_accessor :params

    # disable the rubocop rule for this method
    # rubocop:disable Lint/MissingSuper
    # rubocop:disable Lint/MissingCopEnableDirective
    def initialize(params)
      @params = params
    end

    def call
      validate_token(params[:token])
      model = create_model(params)

      run_process(model)

      { status: :ok, message: 'Process started' }
    rescue StandardError => e
      Rails.logger.error e.message
      Rails.logger.error e.backtrace.join("\n")

      { status: :unprocessable_entity, message: e.message }
    end

    def show
      find_model(params[:token])
    end
  end
end
