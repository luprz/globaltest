class ArrayService
  attr_reader :conf, :result, :array

  def initialize(conf = nil)
    @conf = conf
    @result = []
    @array = []
  end

  def generate
    (0..30).sort{ rand() - 0.5 } .take(@conf)
  end

  def output(input)
    array = []
    input.sort.each do |value|
      select_result(input, value)
    end
    [@result.first, @result.last]
  end

  private

  def select_result(input, value)
    value_next = value + 1
    return @array << value if input.include?(value_next)
      
    array << value
    @result = @array if @result.size < @array.size
    @array = []
  end
end