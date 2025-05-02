require "string_calculator"

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calculator) { StringCalculator.new }

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
  end
end