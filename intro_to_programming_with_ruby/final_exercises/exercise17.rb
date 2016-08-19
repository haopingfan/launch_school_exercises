hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

# These hashes are the same!


array1 = [1,2,3]
array2 = [3,2,1]

if array1 == array2
    puts "These array are the same!"
else
  puts "These array are not the same!"
end

# These array are not the same!