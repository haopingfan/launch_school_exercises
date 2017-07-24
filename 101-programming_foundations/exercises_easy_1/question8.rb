
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones #=> ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]




# We get a nested array, we can un-nested it by flatten! method

flintstones.flatten!

p flintstones #=> ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]



# Or we can use concat method in the first place.

flintstones = ["Fred", "Wilma"]
flintstones.concat(["Barney", "Betty"])
flintstones.concat(["BamBam", "Pebbles"])

p flintstones #=> ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]

