# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number 
  numbers.shift(1) 
end

#=> 1 3

# What would be output by this code? 

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

#=> 1 2

# Don't mutate a collection itself while iterating.
# But mutate the individual elements within that collection.
# Since the iterating follow the new array which is mutated, and will cause the result you don't expect.