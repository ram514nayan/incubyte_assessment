class StringCalculator
  def add input_str
    return 0 if input_str.empty?

    #Input string can accept new line between numbers
    input_str = input_str.gsub(/-\n+/, "#{','}-").split("\n").join(',')
    numbers = input_str.split(',').map(&:to_i)
    invalid_numbers numbers

    numbers.sum
  end

  def invalid_numbers(numbers)
    negative_nums = numbers.select(&:negative?)
    raise ArgumentError, "Negative numbers not allowed: #{negative_nums.join(', ')}" unless negative_nums.empty?
  end

  def check_delimiter(input_str)
    delimiter = ','
    if input_str[0..1].include?("//")
      delimiter = input_str[2]
      validate_delimiter(delimiter)
      input_str = input_str[3..-1]
    end
    input_str = input_str.gsub(/-\n+/, "#{delimiter}-").split("\n").join(delimiter)
    [input_str, delimiter]
  end

  def validate_delimiter(del)
    raise(ArgumentError, "Invalid input: Delimiter should not be number, ") unless del.to_s.match? /^(?![0-9]+$).*/
  end

end



# inputs = ["", "1", "1,2", "1,2,3,4", "1,2,-3,-4", "//@10@15@7", "//A10A15A7A14"]
# calculator = StringCalculator.new
# inputs.each do |input|
#   result = calculator.add(input)
#   puts "Input: #{input.inspect} Output: #{result}"
# end