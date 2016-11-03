# One day Spot was playing with the Munster family's home computer and 
# he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and 
# before Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)

p munsters


# Did the family's data get ransacked, 
# or did the mischief only mangle a local copy of the original hash? (why?)

# ANS: Yes, the family's data get ransacked.
# Why:

=begin

even though the demo_hash has different object_id with demo_hash.values.
they point to the same values.(since it keep the same object_id for nested objects)  
besides, the += new assignment is on family_member["age"], 
munsters["Herman"] has the same object_id as family_member, 
they are still on the same memory space inside and outside the method.
that's why the family's data get ransacked.

=end
