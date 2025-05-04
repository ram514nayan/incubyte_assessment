require "string_calculator"

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calculator) { StringCalculator.new }

    def negative_numbers input
      expect { calculator.add(input) }.to raise_error(ArgumentError, "Negative numbers not allowed: #{input.split(',').map(&:to_i).select(&:negative?).join(', ')}")
    end

    context 'handle for empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'when the input is a single number' do
      it 'returns that number' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'when the input is two numbers' do
      it 'returns their sum' do
        expect(calculator.add('1,2')).to eq(3)
      end
    end

    context 'when the input is multiple numbers' do
      it 'returns their sum' do
        expect(calculator.add('1,2,3')).to eq(6)
        expect(calculator.add('4,5,6,7')).to eq(22)
        expect(calculator.add('10,20,30,40,50')).to eq(150)
      end
    end

     context 'when the input contains newlines as delimiters' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
        expect(calculator.add("4\n5\n6")).to eq(15)
        expect(calculator.add("7,8\n9")).to eq(24)
      end
    end

    context 'when the input contains negative numbers' do
      it 'raises an exception' do
        negative_numbers('1,-2,3')
        negative_numbers('-1,-2,-3')
        negative_numbers('10,-20,30,-40,50')
      end
    end

    context 'when the input contains a custom delimiter' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//;\n1;2")).to eq(3)
        expect(calculator.add("//|\n4|5|6")).to eq(15)
        expect(calculator.add("//,\n7,8,9")).to eq(24)
        expect(calculator.add("//;\n10;20;30")).to eq(60)
      end
    end
    
    context 'when add method called' do
      it 'should return number of times add method being called' do
        calculator.add("")
        calculator.add("4,5")
        calculator.add("//;\n10;20;30")
        expect(calculator.count).to eq(3)

        calc = StringCalculator.new
        5.times { calc.add() }
        expect(calc.count).to eq(5)
      end
    end
  end
end