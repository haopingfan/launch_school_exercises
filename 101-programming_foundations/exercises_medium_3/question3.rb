# Let's call a method, and pass both a string and an array as parameters 
# and see how even though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => pumpkins
# why: += doesn't mutate the caller, it just create a new object and let a_string_param refer to it.
puts "My array looks like this now: #{my_array}"   # => ["pumpkins", "rutabaga"]
# why: << mutate the caller, it doesn't create a new object, it mutate the caller directly within the same memory space
