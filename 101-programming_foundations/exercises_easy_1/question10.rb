
# Given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

#Turn this array into a hash where the names are the keys and the values are the positions in the array.

hash = {}
flintstones.each do |name|
hash[name] = flintstones.index(name)
end

p hash # {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}

#---------------- or ------------------------

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

p hash # {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}


=begin
Note: each_with_index method is from Enumerable module.
Enumerable module is automatically loaded by Array and Hash Classes.
(Kernel is automatically loaded by main, where we write the code, instance of Object.)

We can find out what module is included by .included_modules in irb:

2.2.0 :009 > Array.included_modules
 => [Enumerable, Kernel] 
2.2.0 :010 > Hash.included_modules
 => [Enumerable, Kernel] 
2.2.0 :011 > String.included_modules
 => [Comparable, Kernel] 

=end