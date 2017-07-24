# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# -------- ans ---------

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    self.brightness = brightness
    slef.color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# The answer here is the return in the information method. Ruby automatically returns the result of the 
# last line of any method, so adding return to this line in the method does not add any value and so 
# therefore should be avoided. We also never use the attr_accessor for brightness and color. Though, 
# these methods do add potential value, as they give us the option to alter brightness and color outside 
# the Light class.