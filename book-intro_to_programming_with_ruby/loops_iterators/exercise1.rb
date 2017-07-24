x = [1,2,3,4,5]

r_each = x.each do |a|
  a + 1
end

r_collect = x.collect do |a|
  a + 1
end

puts r_each
puts x.inspect
puts " "
puts r_collect
puts x.inspect


#each method return the original value 
#collect method return the amended value
