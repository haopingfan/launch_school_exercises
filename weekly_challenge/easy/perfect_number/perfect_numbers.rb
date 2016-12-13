class PerfectNumber

  def self.classify(number)
    raise RuntimeError if number <= 0 
    sum_of_factors = factors(number).inject(:+)
    if sum_of_factors == number
      'perfect'
    elsif sum_of_factors < number
      'deficient'
    else
      'abundant'
    end
  end

  def self.factors(number)
    factors = [1] 
    n = 2
    while n < number 
      if number % n == 0
        factors << n
        factors << number / n
      end
      n += 1
    end
    factors.uniq
  end
end