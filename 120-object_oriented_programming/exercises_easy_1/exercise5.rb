# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Ans: the Pizza class has an instance variable and Fruit class has local variable.
#      instance variable will have @ before variable name.
#      If there is attr_accessor :name in Fruit class, there is instance variable too.
#      but name = name will be self.name = name.

# ------------- or ---------------

# or we can check if class has instance variable by instance method 'instance_variables'


fruit = Fruit.new('grap')
pizza = Pizza.new('italy')

p fruit.instance_variables
p pizza.instance_variables