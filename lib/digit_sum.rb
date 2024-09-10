class DigitSum
  # This method calculates the sum of the digits of a given number
  # repeatedly until the result is a single digit.
  # @param [Integer] number A positive integer
  # @return [Integer] The resulting single digit after summing the digits
  # @raise [ArgumentError] If the input is not a positive integer
  def sum_digits(number)
    raise ArgumentError, 'Input must be a positive integer' unless number.is_a?(Integer) && number >= 0

    number = number.digits.sum while number >= 10
    number
  end

  # Calculates the digital root of a number, which is obtained by
  # iteratively summing the digits until a single digit is achieved.
  #
  # The digital root is equivalent to the number modulo 9, with a special case
  # for numbers that are multiples of 9 where the digital root is 9.
  #
  # @param [Integer] number A positive integer for which to calculate the digital root.
  # @return [Integer] The single digit result known as the digital root.
  # @raise [ArgumentError] If the input is not a positive integer.
  def digital_root(number)
    raise ArgumentError, 'Input must be a positive integer' unless number.is_a?(Integer) && number >= 0

    return number if number == 0
    number % 9 == 0 ? 9 : number % 9
  end
end