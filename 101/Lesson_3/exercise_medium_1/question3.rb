# Question:
# The result of the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

puts "the value of 40 + 2 is " + (40 + 2)


# Answer:
# Why: The string can't + integer
# This will raise an error TypeError: no implicit conversion of Fixnum into String because (40+2) 
# results in an integer and it is being concatenated to a string.

# How to fix:
# way1
puts "the value of 40 + 2 is " + (40 + 2).to_s

# way2
puts "the value of 40 + 2 is #{40 + 2}"
