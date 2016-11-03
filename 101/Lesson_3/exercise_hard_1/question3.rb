# What will be printed by each of these code groups?

# A not-mutate
def mess_with_vars(one, two, three)
  one = two  
  two = three 
  three = one 
end

one = "one"
two = "two"
three = "three"
mess_with_vars(one, two, three)

puts "one is: #{one}"          #=> "one" 
puts "two is: #{two}"          #=> "two"
puts "three is: #{three}"      #=> "three"

# B not-mutate
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"
mess_with_vars(one, two, three)

puts "one is: #{one}"         #=> "one"
puts "two is: #{two}"         #=> "two"
puts "three is: #{three}"     #=> "three"

# C mutate
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"
mess_with_vars(one, two, three)

puts "one is: #{one}"        #=> "two"
puts "two is: #{two}"        #=> "three"
puts "three is: #{three}"    #=> "one"