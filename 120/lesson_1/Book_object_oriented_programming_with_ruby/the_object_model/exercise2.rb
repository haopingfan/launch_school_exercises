=begin
  
a module is a collection of behaviors(methods) and 
can be used by other classes.

The purpose of module is that the programmer don't have to
repeatedly writing the same method used by different classes.
(A module allows programmer to group reusable code into one 
place)

they can used them by "include" the module with the classes.  

=end

module Bark
  def bark
  end
end

class GoodDog
  include Bark
end

lucky = GoodDog.new
lucky.bark

=begin

Module can also be used for "namespacing".

Suppose we have a lot of class named "Myclass" To distinguish between 
this MyClass and others, we create module for this MyClass. 

=end

module Outer
  class MyClass
  end
end

my_obj = MyClass.new   #(can't work, we need to add "Outer::" before MyClass)  
my_obj = Outer::MyClass.new 