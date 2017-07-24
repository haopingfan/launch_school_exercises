numbers = [1,2,3,4,5,6,7,8,9,10,]

greater_than_five = numbers.select {|num| num > 5}
greater_than_five.each { |num| puts num }

#or 

numbers.each do |num|
  puts num if num > 5
end