module Services
  class Data
    VARIABLES = {
      year: (1900..Time.now.year + 2).map { |y| y },
      make: [ 'Ford', 'Chevrolet', 'Toyota', 'Renault' ],
      model: [ 'Impala', 'Focus', 'Corolla', 'Reno', 'Corsa', 'Fiesta', 'Sentra' ],
      trim: [ 'ST', 'SE' ]
    }

    def self.call(input)
      result = {}
      input.each do |key, value|
        next result[key] = nil if value == 'blank'

        result[key] = self.add_format(input, key, value)
      end
      result
    end

    private

    def self.add_format(input, key, value)
      if key.eql?(:year)
        self.year_format(value)
      elsif key.eql?(:trim)
        self.trim_format(input, key, value)
      else
        self.model_and_make_format(key, value)
      end
    end

    def self.year_format(value)
      VARIABLES[:year].include?(value.to_i) ? value.to_i : value
    end

    def self.trim_format(input, key, value)
      new_value = self.new_trim(input, value, key)
      new_value.empty? ? value : new_value.first
    end

    def self.model_and_make_format(key, value)
      new_value = value.split(' ').first.capitalize
      new_value = VARIABLES[key.to_sym].select { |f| new_value.include?(f) || f.include?(new_value) }
      new_value.empty? ? value : new_value.first
    end

    def self.new_trim(input, value, key)
      return VARIABLES[:trim].select { |t| input[:model].split(' ').last.upcase.include?(t)  } if value.eql?('')

      VARIABLES[key.to_sym].select { |f| value.upcase.include?(f) }
    end
  end
end