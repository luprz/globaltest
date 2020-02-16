class CarsController < ApplicationController
  before_action :authenticate

  def create
    render json: ::Services::Data.(input_params.to_h)
  end

  private

  def input_params
    params.require(:input).permit(:year, :make, :model, :trim)
  end
end
