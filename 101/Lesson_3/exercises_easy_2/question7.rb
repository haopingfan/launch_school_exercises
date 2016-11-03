# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("Dino") #=> false
p advice.include?("pet")  #=> true

p advice.match("Dino") #=> nil
p advice.match("pet") #=> #<MatchData "pet">