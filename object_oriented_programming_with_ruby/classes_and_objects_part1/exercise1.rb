class MyCar

  attr_accessor :current_speed

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

end

ferrari = MyCar.new(1989,"red","Ferrari GTC")
ferrari.speed_up(30)
ferrari.speed_now
ferrari.brake(30)
ferrari.speed_now
ferrari.speed_up(40)
ferrari.speed_now
ferrari.shut_off
ferrari.speed_now