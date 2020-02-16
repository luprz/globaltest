class ArrayValidations 
  def initialize(array)
    @array = array
  end

  def validate?
    integer? && more_than_nine?
  end

  def error
    return { error: 'El parametro de array no es entero' } unless integer?
      
    { error: 'El parametro de array no debe ser menor a 10' }
  end

  private

  def integer?
    true if @array.to_i rescue false
  end

  def more_than_nine?
    @array.to_i > 9
  end
end