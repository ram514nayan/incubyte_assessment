require "string_calculator"

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calculator) { StringCalculator.new }

    context 'handle for empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end
  end
end