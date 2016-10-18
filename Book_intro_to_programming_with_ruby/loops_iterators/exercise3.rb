array = ["one","two","three","four","five"]

array.each_with_index do |num,index|
  puts "#{index+1}. #{num}"
end

