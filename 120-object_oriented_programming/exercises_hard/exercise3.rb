# Ben and Alyssa are working on a vehicle management system. So far, they have created classes 
# called Auto and Motorcycle to represent automobiles and motorcycles. After having noticed common 
# information and calculations they were performing for each type of vehicle, they decided to break 
# out the commonality into a separate class called WheeledVehicle. This is what their code looks like 
# so far:

# Now Alan has asked them to incorporate a new type of vehicle into their system 
# - a Catamaran defined as follows:

# This new class does not fit well with the object hierarchy defined so far.
# Catamarans don't have tires. But we still want common code to track fuel efficiency and range.
# Modify the class definitions and move code into a Module, as necessary, to share code among the 
# Catamaran and the wheeled vehicles.

module Movable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Movable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end


# Building on the prior vehicles question, we now must also track a basic motorboat. 
# A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. 
# Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers. 
# How would you modify the vehicles code to incorporate a new Motorboat class?

class SeaCraft
  include Movable
  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.propellers_count = num_propellers
    self.hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end


class Catamaran < SeaCraft 
end

class Motorboat < SeaCraft

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1,1, km_traveled_per_liter, liters_of_fuel_capacity)
  end

end



