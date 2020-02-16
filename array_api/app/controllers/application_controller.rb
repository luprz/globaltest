class ApplicationController < ActionController::API
  def authenticate
    autenticate = Authentication.new(request)
    render json: autenticate.error, status: 403 unless autenticate.success?
  end

  def validate
    validation = ArrayValidations.new(params[:array])
    render json: validation.error, status: 500 unless validation.validate?
  end
end
