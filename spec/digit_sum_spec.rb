require 'rspec'
require 'benchmark'
require './lib/digit_sum'

RSpec.describe DigitSum do
  let(:digit_sum) { DigitSum.new }

  describe '#sum_digits' do
    it 'returns 7 for the input 16' do
      expect(digit_sum.sum_digits(16)).to eq(7)
    end

    it 'returns 6 for the input 942' do
      expect(digit_sum.sum_digits(942)).to eq(6)
    end

    it 'returns 9 for the input 9999999999' do
      expect(digit_sum.sum_digits(9999999999)).to eq(9)
    end

    it 'returns 9 for the input 18' do
      expect(digit_sum.sum_digits(18)).to eq(9)
    end

    it 'returns 5 for the input 1463' do
      expect(digit_sum.sum_digits(1463)).to eq(5)
    end

    it 'raises an error for negative numbers' do
      expect { digit_sum.sum_digits(-1) }.to raise_error(ArgumentError, 'Input must be a positive integer')
    end

    it 'raises an error for non-integer inputs' do
      expect { digit_sum.sum_digits(3.5) }.to raise_error(ArgumentError, 'Input must be a positive integer')
      expect { digit_sum.sum_digits("abc") }.to raise_error(ArgumentError, 'Input must be a positive integer')
    end

    it 'returns 0 for the input 0' do
      expect(digit_sum.sum_digits(0)).to eq(0)
    end

    it 'it handle large numbers' do
      expect(digit_sum.sum_digits(12345678901234567890)).to eq(9)
    end
  end

  describe '#digital_root' do
    it 'returns 7 for the input 16' do
      expect(digit_sum.digital_root(16)).to eq(7)
    end

    it 'returns 6 for the input 942' do
      expect(digit_sum.digital_root(942)).to eq(6)
    end

    it 'returns 9 for the input 9999999999' do
      expect(digit_sum.digital_root(9999999999)).to eq(9)
    end

    it 'returns 9 for the input 18' do
      expect(digit_sum.digital_root(18)).to eq(9)
    end

    it 'returns 5 for the input 1463' do
      expect(digit_sum.digital_root(1463)).to eq(5)
    end

    it 'it handles multiples of 9 correctly' do
      expect(digit_sum.digital_root(81)).to eq(9)
    end

    it 'it handles numbers that are not multiples of 9 correctly' do
      expect(digit_sum.digital_root(82)).to eq(1)
    end

    it 'it handles numbers that are less than 9 correctly' do
      expect(digit_sum.digital_root(8)).to eq(8)
    end

    it 'it handles numbers that are equal to 9 correctly' do
      expect(digit_sum.digital_root(9)).to eq(9)
    end

    it 'it handles large numbers efficiently' do
      expect(digit_sum.digital_root(12345678901234567890)).to eq(9)
    end

    it 'raises an error for negative numbers' do
      expect { digit_sum.digital_root(-1) }.to raise_error(ArgumentError, 'Input must be a positive integer')
    end

    it 'raises an error for non-integer inputs' do
      expect { digit_sum.digital_root(3.5) }.to raise_error(ArgumentError, 'Input must be a positive integer')
      expect { digit_sum.digital_root("abc") }.to raise_error(ArgumentError, 'Input must be a positive integer')
    end

    it 'returns 0 for the input 0' do
      expect(digit_sum.digital_root(0)).to eq(0)
    end
  end

  describe '#performance' do
    it 'compares performance of sum_digits and digital_root' do
      large_number = 12345678901234567890

      sum_digits_time = Benchmark.realtime do
        digit_sum.sum_digits(large_number)
      end

      digital_root_time = Benchmark.realtime do
        digit_sum.digital_root(large_number)
      end

      puts "Time taken for sum_digits: #{sum_digits_time} seconds"
      puts "Time taken for digital_root: #{digital_root_time} seconds"

      expect(digit_sum.digital_root(large_number)).to eq(digit_sum.sum_digits(large_number))
      expect(digital_root_time).to be < sum_digits_time
    end
  end
end