
# Add up all of the ages from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }


# way1
sum = 0

ages.each_value do |age|
  sum += age
end

p sum #=> 6174


# way2
p ages.values.inject(:+) #=> 6174

# ==== or ====

p ages.values.inject {|sum, n| sum + n } #=> 6174


=begin

This uses ages.values to make an array, [32, 30, 5843, 10 ,22, 237].
then uses the inject method which is part of the Enumerable module which is included in Array. 
it is wise to augment your knowledge of what you can do with arrays by studying Enumerable.

The strange-looking parameter to inject is simply a variety of the inject method which says 
"apply the + operator to the accumulator and object parameters of inject".

=end