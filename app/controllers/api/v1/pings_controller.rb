class Api::V1::PingsController < ApplicationController
  def show
    render json: {}, status: :ok
  end
end
