# In the age hash, throw out the really old people (age 100 or older).

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# way1
ages.select! { |_, age| age < 100 } 
p ages #=> {"Herman"=>32, "Lily"=>30, "Eddie"=>10}


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# way2
ages.keep_if { |_, age| age < 100 }
p ages #=> {"Herman"=>32, "Lily"=>30, "Eddie"=>10}





