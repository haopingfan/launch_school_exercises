# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.


# way1

p ages.has_key?("Spot") #=> false
p ages.has_key?("Herman") #=> true

# way2

p ages.include?("Spot") #=> false
p ages.include?("Herman") #=> true

# way3

p ages.key?("Spot") #=> false
p ages.key?("Herman") #=> true

#way4

p ages.member?("Spot") #=> false
p ages.member?("Herman") #=> true