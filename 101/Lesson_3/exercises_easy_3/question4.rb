=begin
Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

...remove everything starting from "house".

Review the String#slice! documentation, and use that method to make the return value 
"Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

As a bonus, what happens if you use the String#slice method instead?
=end

# way1
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!("Few things in life are as important as ") #=> "Few things in life are as important as "
p advice #=> "house training your pet dinosaur." mutate the caller


advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice("Few things in life are as important as ") #=> "Few things in life are as important as "
p advice #=> "Few things in life are as important as house training your pet dinosaur." not mutate the caller


# way2 (Prefer)

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(advice[0, advice.index("house")])
p advice
