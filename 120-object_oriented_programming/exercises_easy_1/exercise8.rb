# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. 
# What does self refer to here?

# Within an instance method, the 'self' refer to the object calling this instance method.
# In this case, it refer to the object of class cat.

# We need a self here because we want to call the age= setter method.
# we need to tell ruby that it is not a local variable re-assignment (age += 1)