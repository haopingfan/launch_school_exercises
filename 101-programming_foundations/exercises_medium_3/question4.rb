# To drive that last one home...let's turn the tables and have the string show a modified output, 
# while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" #=>  "pumpkinsrutabaga"
# << mutate the caller, it doesn't create a new object, it append the element to the same object as we pass in.

puts "My array looks like this now: #{my_array}"   #=>  ["pumpkins"]
# = doesn't mutate the caller, it create a new object, and refer to it with my_array variable.