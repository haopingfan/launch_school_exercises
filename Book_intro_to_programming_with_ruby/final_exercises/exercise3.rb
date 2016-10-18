numbers = [1,2,3,4,5,6,7,8,9,10,]

odd_array = numbers.select { |num| (num % 2) == 1 } 

#or 

o_array = numbers.select { |num| (num % 2) != 0 } 