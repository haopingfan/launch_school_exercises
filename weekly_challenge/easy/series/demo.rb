class Series
  attr_reader :string_of_digits

  def initialize(string_of_digits)
    @string_of_digits = string_of_digits.chars.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError, 'slice is larger than input' if num > string_of_digits.length
    string_of_digits.each_cons(num).to_a
  end

end