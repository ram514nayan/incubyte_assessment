require_relative 'lib/string_calculator'

calculator = StringCalculator.new

# Test cases
inputs = ["", "1", "1,2", "1,2,3,4", "1,2,-3,-4", "//@10@15@7", "//A10A15A7A14", "//910915979-14", "23,43,34\n\n\n234\n-21,45,\n,\n,50\n" ,"//;23;43;-34\n\n\n234\n21;45;\n;\n50" ,"//&5\n10&\n20"]

inputs.each do |input|
  result = calculator.add(input)
  if result.class == Integer
    puts "Input: #{input.inspect} Output: #{result}"
  else
    puts "Input: #{input.inspect} Error: #{result.inspect}"
  end
end
