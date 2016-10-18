hash = {name: "Derek", age: 27, city: "Taipei"}

hash.keys.each do |k|
  p k
end

hash.values.each do |v|
  p v
end

hash.each do |k,v|
  puts "#{k}, #{v}"
end