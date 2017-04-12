# Your code here
require 'spec_helper'
require 'calculator'
describe Calculator do
  let(:c){ Calculator.new}

  describe '.initialize' do
    it 'should be a calculator' do
      expect(c).to be_a(Calculator)
    end

    it 'should have an empty memory' do
      expect(c.memory).to eq(nil)
    end
  end

  describe '.add' do
    it 'returns the sum of two numbers' do
      expect(c.add(1,2)).to eq(3)
    end

    it 'can handle negative numbers' do
      expect(c.add(-2,4)).to eq(2)
    end

    it 'can handle floats' do
      expect(c.add(3.0,9.0)).to eq(12.0)
    end
  end

  describe '.subtract' do
    it 'subtracts second argument from first' do
      expect(c.subtract(1,2)).to eq(-1)
    end

    it 'can also subtract floats' do
      expect(c.subtract(6.4, 2.1)).to eq(4.3)
    end

    it 'subtracts two floats' do
      expect(c.subtract(2.5, 0.3)).to eq(2.2)
    end
  end

  describe '.multiply' do
    it 'multiplies arguments' do
      expect(c.multiply(3,6)).to eq(18)
    end

    it 'returns positive value for two negative numbers' do
      expect(c.multiply(-4,-3)).to eq(12)
    end
  end

  describe '.divide' do
    it 'doesn\'t allow division by zero' do
      expect{c.divide(1,0)}.to raise_error(ArgumentError)
    end

    it 'returns decimals to 16 places' do
      expect(c.divide(2,3)).to eq(0.6666666666666666)
    end

  end

  describe '.pow' do
    it 'raises first argument to second argument\'s power as float' do
      expect(c.pow(2,3)).to eq(8.0)
    end

    it 'can take numbers to fractional powers' do
      expect(c.pow(27,1/3.0)).to eq(3.0)
    end

    it 'can take numbers to negative powers' do
      expect(c.pow(4,-2)).to eq(1/16.0)
    end

  end

  describe '.sqrt' do
    it 'returns square root of argument' do
      expect(c.sqrt(9)).to eq(3)
    end

    it 'returns imperfect square roots with remainder two decimal places' do
      expect(c.sqrt(8)).to eq(2.83)
    end

    it 'does not allow for the square root of negative numbers' do
      expect{c.sqrt(-3)}.to raise_error
    end
  end

  describe '.memory=' do
    it 'should assign input value' do
      expect(c.memory=(8)).to eq(8)
    end
  end

  describe '.memory' do
    before(:each) do
    end

    it 'clears input value' do
      c.memory=(8)
      c.memory
      expect(c.memory).to eq(nil)
    end
  end

  describe '.stringify' do
    let(:str_calc) {Calculator.new(true)}
    it 'returns output as string' do
      expect(str_calc.add(2,2)).to be_a(String)
    end
  end

end
