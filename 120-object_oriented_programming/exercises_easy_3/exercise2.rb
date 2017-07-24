=begin
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
     greet("Shit")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi #=> undefined method `hi' for Hello:Class


class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
     greet("Shit")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi #=> undefined method `greet' for Hello:Class
=end

#-------------------------------------------------------

class Greeting
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
     greet("Shit")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi #=> Shit


#------ or --------

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
     greeting = Greeting.new
     greeting.greet("Shit")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi #=> Shit


