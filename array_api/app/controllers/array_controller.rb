class ArrayController < ApplicationController
  before_action :authenticate
  before_action :validate, only: :create

  def index
    render json: ArrayList.all
  end
  
  def create
    array = ArrayService.new(params[:array].to_i)
    array_list = ArrayList.create(data: array.generate.join(','))
    render json: { id: array_list.id, data: array_list.input, output: nil }
  end

  def show
    input = ArrayList.find(params[:array_id]).input
    array = ArrayService.new
    render json: { result: array.output(input) }
  end
end
