class Vehicle
  def self.gas_mileage(miles,gallons)
    puts "Gas mileage is #{miles / gallons} miles per gallon"
  end
end

class MyCar < Vehicle
   NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end
