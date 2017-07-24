puts "what's your first name?"
first_name = gets.chomp.capitalize

puts "what's your last name?"
last_name = gets.chomp.capitalize

puts "welcome, #{first_name} #{last_name}!"
10.times { puts first_name + " " + last_name }

