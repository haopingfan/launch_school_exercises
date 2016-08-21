class MyCar

  attr_accessor :current_speed, :color
  attr_reader :year

  def initialize(year,color,model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
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

  def speed_nows
    puts "you are now going #{self.current_speed} mph"
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "your car has been painted new color #{new_color} "
  end

end

ferrari = MyCar.new(1989,"red","Ferrari GTC")
puts ferrari.year
ferrari.spray_paint("yellow")
puts ferrari.color