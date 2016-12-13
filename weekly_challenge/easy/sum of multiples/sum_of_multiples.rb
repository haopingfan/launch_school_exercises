class SumOfMultiples
  attr_reader :set_of_numbers

  def initialize(*set_of_numbers)
    @set_of_numbers = set_of_numbers
  end

  def self.to(limit)
    return 0 if limit <= 1
    (1...limit).select {|num| num % 3 == 0 || num % 5 == 0}.inject(:+)
  end

  def to(limit)
    multiples = []
    set_of_numbers.each do |based_number|
      (1...limit).each do |natural_number|
        multiples << natural_number if natural_number % based_number == 0
      end
    end
    multiples.uniq.inject(:+)
  end

end