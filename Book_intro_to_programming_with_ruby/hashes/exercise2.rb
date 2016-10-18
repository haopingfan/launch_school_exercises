hash1 = {name: "Derek", age: 27,}
hash2 = {city: "Taipei"}

p hash1.merge(hash2)
p hash1

p hash1.merge!(hash2)
p hash1

=begin 

DerekdeMacBook-Pro:hashes derekfan$ ruby exercise2.rb
{:name=>"Derek", :age=>27, :city=>"Taipei"}
{:name=>"Derek", :age=>27}
{:name=>"Derek", :age=>27, :city=>"Taipei"}
{:name=>"Derek", :age=>27, :city=>"Taipei"}

the merge method doesn't metate the caller
the merge! method mutate the caller

=end
