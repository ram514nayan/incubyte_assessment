class StringCalculator
  attr_accessor :count
  
  def initialize
    @count = 0
  end

  def add input_str
    @count += 1
    return 0 if input_str.empty?

    input, delimiter = delimitere_used(input_str)
    regex_str = /^[\d\(\)\-#{delimiter}]+$/
    validate_string(input, regex_str)
    numbers = input.split(delimiter).map(&:to_i)
    negative_numbers(numbers)
    numbers.select { |n| n <= 1000  }.sum
  end

  def negative_numbers(numbers)
    negative_nums = numbers.select(&:negative?)
    raise ArgumentError, "Negative numbers not allowed: #{negative_nums.join(', ')}" unless negative_nums.empty?
  end

  def delimitere_used(input_str)
    delimiter = ','
    if input_str[0..1].include?("//")
      delimiter = input_str[2]
      validate_delimiter(delimiter)
      input_str = input_str[3..-1]
    end
    input_str = input_str.gsub(/-\n+/, "#{delimiter}-").split("\n").join(delimiter)
    puts input_str
    [input_str, delimiter]
  end

  def validate_delimiter(del)
    raise(ArgumentError, "Invalid input: Delimiter should not be number, #{del}") unless del.to_s.match? /^(?![0-9]+$).*/
  end

  def validate_string input, regex_str
    unless input.match regex_str
      raise(ArgumentError, "Invalid input: Only allowed specified delimiter as (//delimiter) with integer, ")
    end
  end

end
