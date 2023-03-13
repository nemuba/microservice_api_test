# frozen_string_literal: true

class SerprosController < ApplicationController
  def create
    data = SerproService::Service.call(serpro_params)

    render json: { message: data[:message] }, status: data[:status]
  end

  def show
    data = SerproService::Service.show(params.to_unsafe_h)

    render json: data, status: :ok
  end

  private

  def serpro_params
    params.require(:serpro).permit(:token, :document, :status)
  end
end
