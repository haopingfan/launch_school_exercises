# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

p flintstones.find_index { |name| name.start_with?("Be") } #=> 3
p flintstones.index { |name| name.start_with?("Be") } #=> 3

# PS: find index directly with name "Betty"

p flintstones.find_index("Betty") #=> 3
p flintstones.index("Betty") #=> 3

