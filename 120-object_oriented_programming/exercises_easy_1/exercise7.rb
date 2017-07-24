# What is the default thing that Ruby will print to the screen if you call to_s on an object? 
# Where could you go to find out if you want to be sure?

# the default to_s method on a obejct will give us 
# 1.the class this object belongs to. 
# 2.an encoding of the object id to the console.

class Test
end

test = Test.new

puts test
