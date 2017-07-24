=begin
  
In the previous exercise we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

We could have used either Array#concat or Array#push to add Dino to the family.
How can we add multiple items to our array? (Dino and Hoppy)
  
=end

# way1
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.concat(%w(Dino Hoppy)) # concat adds an array rather than one item
p flintstones

#way2
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
addition = %w(Dino Hoppy)

addition.each do |add_item|
flintstones.push(add_item)
end
p flintstones

#way3
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino").push("Hoppy")  # push returns the array so we can chain
p flintstones



