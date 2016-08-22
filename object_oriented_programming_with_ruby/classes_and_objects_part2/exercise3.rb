=begin

class Person

  attr_reader :name

  def initialize(name)
    @name = name
  end

end

bob = Person.new("Steve")
bob.name = "Bob"
 
-------------

test.rb:9:in `<main>': undefined method `name=' 
we get this error because attr_reader only has getter method, no setter method.
we can change "attr_reader" to "attr_accessor" to have both getter and setter method.

=end 

class Person

  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name