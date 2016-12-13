class Trinary
  BASE = 3

  attr_reader :trinary_num

  def initialize(trinary_num)
    @trinary_num = trinary_num
    @trinary_num = '0' if invalid_input?
  end

  def to_decimal
    sum = 0
    trinary_num.chars.reverse.each_with_index do |num, index|
      sum += num.to_i * BASE ** index  
    end
    sum
  end

  def invalid_input?
    trinary_num[0] == 0 || 
    trinary_num.match(/[^\d]/) || 
    trinary_num.chars.any? { |num| num.to_i >= BASE } 
  end
end
