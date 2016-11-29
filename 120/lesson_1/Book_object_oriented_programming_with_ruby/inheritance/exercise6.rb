require 'time'

module Loadable
  def load
    "the truck has been loaded"
  end
end

class Vehicle
  attr_accessor :current_speed, :color
  attr_reader :year
  @@number_of_objects = 0

  def initialize(year,color,model)
    @@number_of_objects += 1
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def self.number_of_objects
    puts @@number_of_objects
  end

  def self.gas_mileage(miles,gallons)
    puts "Gas mileage is #{miles / gallons} miles per gallon"
  end

  def speed_up(speed)
    @current_speed += speed
    puts "the car accelerate #{speed} mph"
  end

  def brake(speed)
    @current_speed -= speed
    puts "the car decelerate #{speed} mph"
  end

  def shut_off
    self.current_speed = 0
    puts "the car is shut off"
  end

  def speed_now
    puts "you are now going #{self.current_speed} mph"
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "your car has been painted new color #{new_color} "
  end

  def age
    "Your vehicle is #{calculate_the_age} years old"
  end

  private

  def calculate_the_age
    Time.now.year - self.year
  end

end

class MyCar < Vehicle
   NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  include Loadable
  
  NUMBER_OF_DOORS = 2
end

c = MyCar.new(1989,"red","ferri")
puts c.age