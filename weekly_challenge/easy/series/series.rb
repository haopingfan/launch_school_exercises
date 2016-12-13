class Series
  attr_reader :string_of_digits

  def initialize(string_of_digits)
    @string_of_digits = string_of_digits
  end

  def slices(num)
    raise ArgumentError, 'slice is longer than input ' if num > string_of_digits.length

    result = []
    index = 0
    while (index + num) <= string_of_digits.length
      result << string_of_digits[index, num].split('').map(&:to_i)
      index += 1
    end
    result  
  end


end