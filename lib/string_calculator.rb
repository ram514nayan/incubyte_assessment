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
end