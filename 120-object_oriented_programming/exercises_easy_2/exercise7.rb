class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. 
# What code would you need to write to test your theory?

# Ans: the class variable @@cats_count counts the number of object of the Cat class initialize.
# the value in @@cats_count +1 whenever the instance method initialize gets call.
# instance method initialize automatically get called whenever Class method .new gets call.

p Cat.cats_count #=> 0

lucky = Cat.new('Boz')

p Cat.cats_count #=> 1

