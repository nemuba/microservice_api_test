# frozen_string_literal: true

class SerproJob < ApplicationJob
  sidekiq_options queue: :serpro_job

  def perform(token)
    sleep 2
    model = Serpro.find_by(token: token)
    model.update(status: :success)
  end
end
