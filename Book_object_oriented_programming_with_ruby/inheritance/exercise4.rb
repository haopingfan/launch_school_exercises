class Vehicle

  @@number_of_objects = 0

  def initialize
    @@number_of_objects += 1
  end

  def self.number_of_objects
    puts @@number_of_objects
  end

  def self.gas_mileage(miles,gallons)
    puts "Gas mileage is #{miles / gallons} miles per gallon"
  end

end

module Loadable
  def load
    "the truck has been loaded"
  end
end

class MyCar < Vehicle
   NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  include Loadable
  
  NUMBER_OF_DOORS = 2
end

puts MyTruck.ancestors
puts MyCar.ancestors
puts Vehicle.ancestors