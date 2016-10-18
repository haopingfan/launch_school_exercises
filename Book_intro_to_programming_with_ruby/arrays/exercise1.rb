arr = [1, 3, 5, 7, 9, 11]
number = 3

if arr.include?(number)
  puts "#{number} is in the array"
end

arr.each do |num|
  if num == number
    puts "#{number} is in the array"
  end
end