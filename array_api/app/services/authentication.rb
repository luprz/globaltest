class Authentication
  attr_reader :request

  API_KEY = ENV['API_KEY']

  def initialize(request)
    @request = request
  end

  def success?
    "Bearer #{API_KEY}" == @request.env['HTTP_AUTHENTICATION']
  end

  def error
    { error: 'Authentication is incorrect' }
  end
end