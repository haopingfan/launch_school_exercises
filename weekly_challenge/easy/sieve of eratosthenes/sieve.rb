class Sieve
  attr_reader :array 

  def initialize(limit)
    @array = (2..limit).to_a
  end

  def primes
    array.each do |prime|
      array.delete_if { |num| num % prime == 0 && num != prime }
    end
    array
  end


end