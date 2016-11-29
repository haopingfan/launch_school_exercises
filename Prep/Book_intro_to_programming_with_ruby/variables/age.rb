puts "How old are you?"
age = gets.chomp.to_i

array = [10,20,30,40]

array.each do |x|
  puts "In #{x} years you will be:"
  puts age + x
end