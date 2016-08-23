#Add a class variable to your superclass that can keep track of the number of 
#objects created that inherit from the superclass. 
#Create a method to print out the value of this class variable as well.

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


class MyCar < Vehicle
   NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end

c = MyCar.new
c2 = MyCar.new
t = MyTruck.new

Vehicle.number_of_objects
#=> 3