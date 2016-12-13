class Octal
  BASE = 8

  attr_reader :octal_num

  def initialize(octal_num)
    @octal_num = octal_num
    @octal_num = '0' if invalid_input?
  end

  def to_decimal
    sum = 0
    octal_num.chars.reverse.each_with_index do |num, index|
      sum += num.to_i * BASE ** index  
    end
    sum
  end

  def invalid_input?
    octal_num[0] == 0 || 
    octal_num.match(/[^\d]/) || 
    octal_num.chars.any? { |num| num.to_i >= BASE } 
  end
end
