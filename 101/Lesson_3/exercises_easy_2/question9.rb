# Using array#map!, shorten each of these names to just 3 characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name.slice(0..2)
end

p flintstones #=> ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]


#==== or ====


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0, 3]
end

p flintstones #=> ["Fre", "Bar", "Wil", "Bet", "Bam", "Peb"]
