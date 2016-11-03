=begin

For this exercise, write a one-line program that creates the following output 10 times, 
with the subsequent line indented 1 space to the right:

The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!

=end

# way1 

space = "" 
10.times do
    puts space + "The Flintstones Rock!" 
    space << " " 
end

# way2

10.times { |number| puts " "*number + "The Flintstones Rock!" }