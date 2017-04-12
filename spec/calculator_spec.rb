# Your code here
require 'spec_helper'
require 'calculator'
describe Calculator do
  let(:calculator){ Calculator.new}

  describe '.initialize' do
    it 'should be a calculator' do
      expect(calculator).to be_a(Calculator)
    end

    it 'should have an empty memory' do
      expect(calculator.memory).to eq(nil)
    end
  end

  describe '.add' do
    it 'returns the sum of two numbers' do
      expect(calculator.add(1,2)).to eq(3)
    end

    it 'can handle negative numbers' do
      expect(calculator.add(-2,4)).to eq(2)
    end

    it 'can handle floats' do
      expect(calculator.add(3.0,9.0)).to eq(12.0)
    end
  end

  describe '.subtract' do
    it 'subtracts second argument from first' do
      expect(calculator.subtract(1,2)).to eq(-1)
    end

    it 'can also subtract floats' do
      expect(calculator.subtract(6.4, 2.1)).to eq(4.3)
    end
  end

  describe '.multiply' do
    it 'multiplies arguments' do
      expect(calculator.multiply(3,6)).to eq(18)
    end

    it 'returns positive value for two negative numbers' do
      expect(calculator.multiply(-4,-3)).to eq(12)
    end
  end

  describe '.divide' do
    it 'doesn\'t allow division by zero' do
      expect(calculator.divide(1,0)).to raise_error(ArgumentError)
    end

    it 'returns decimals to 16 places' do
      expect(calculator.divide(2,3)).to eq(0.6666666666666666)
    end
  end

  describe '.pow' do
    it 'raises first argument to second argument\'s power as float' do
      expect(calculator.pow(2,3)).to eq(8.0)
    end

    it 'can take numbers to fractional powers' do
      expect(calculator.pow(27,1/3.0)).to eq(3.0)
    end

    it 'can take numbers to negative powers' do
      expect(calculator.pow(4,-2)).to eq(1/16.0)
    end

  end

  describe '.sqrt' do
    it 'returns square root of argument' do
      expect(calculator.sqrt(9)).to eq(3)
    end

    it 'returns imperfect square roots with remainder two decimal places' do
      expect(calculator.sqrt(8)).to eq(2.83)
    end

    it 'does not allow for the square root of negative numbers' do
      expect(calculator.sqrt(-3,2)).to raise_error(ArgumentError)
    end
  end

  describe '.memory=' do
    it 'should assign input value' do
      expect(calculator.memory=(8)).to eq(8)
    end
  end

  describe '.memory' do
    before(:each) do
      calculator.memory=(8)
      calculator.memory
    end

    it 'clears input value' do
      expect(calculator.memory).to eq(nil)
    end
  end

  describe '.stringify' do
    let(:str_calc) {Calculator.new(true)}
    it 'returns output as string' do
      expect(str_calc.add(2,2)).to be_a(String)
    end
  end

end
