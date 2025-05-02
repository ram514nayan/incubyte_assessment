class StringCalculator
  def add input_str
    return 0 if input_str.empty?

    numbers = input_str.split(',').map(&:to_i)
    numbers.sum
  end
end