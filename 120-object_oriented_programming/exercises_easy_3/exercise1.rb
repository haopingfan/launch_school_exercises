class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# ---------------------------

# case 1
hello = Hello.new
hello.hi #=> 'Hello'

# case 2
hello = Hello.new
hello.bye #=> NoMethod error

# case 3
hello = Hello.new
hello.greet #=> Wrong argument number error (0 for 1)

# case 4
hello = Hello.new
hello.greet("Goodbye") #=> 'Goodbye'

# case 5

Hello.hi #=> NoMethod error, can't find class method hi