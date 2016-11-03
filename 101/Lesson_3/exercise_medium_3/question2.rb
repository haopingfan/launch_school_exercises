# Let's look at object id's again from the perspective of a method call instead of a block.
# Predict how the values and object ids will change throughout the flow of the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  #                    42                         85
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  #                 forty two                70357542479180
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  #                   [42]                   70357542479160
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"
  #                    42                         85

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  #                     42                         85                          85                  # the method doesn't mutate the caller.
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  #                 forty two                70357542479180                70357542479180          # the method doesn't mutate the caller.
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  #                   [42]                   70357542479160                70357542479160          # the method doesn't mutate the caller.
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"
  #                    42                         85                           85                  # the method doesn't mutate the caller.

  # Even though we changed the values of our "outer" variables inside the method call, we still have the same values and the same object id's down here AFTER the method call as we had before it!
  # This is because our method call accepts VALUES as parameters. The names we give to those values in the definition of our method are SEPARATE from any other use of those same names.
  # We used the same names there for convenience (and admittedly to build some suspense and allow us to clarify this point). We could just as easily have called the first parameter of our method definition a_Fred instead of a_outer.
  # The method gets the VALUES of the parameters we pass, but the parameter variables inside the method have no other relationship to those outside of the method. The names were coincidental, and confusing in a useful way.

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  # "ugh ohhhhh" , can't access the local variable of another method
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  # "ugh ohhhhh" , can't access the local variable of another method
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  # "ugh ohhhhh" , can't access the local variable of another method
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
  # "ugh ohhhhh" , can't access the local variable of another method

  # Our main method STILL has no access to variables that are defined inside of the method.

end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  #                         85                                          85
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  #                     70357542479180                             70357542479180
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  #                     70357542479160                             70357542479160
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.\n\n"
  #                         85                                          85

  # These "outers" are NOT the same variables as those outside, 
  # Ruby is simply re-using the objects, as these new variables have the same values as the ones outside.

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  #                                               22                         85                            45
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  #                                          thirty three               70357542479180                70357542478460 
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  #                                              [44]                   70357542479160                70357542478440
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"
  #                                               44                         85                            89                        

 # As before with the block version of this exercise, when we change the values of our "outers", 
 # Ruby uses new objects for these variables to deal with their new values.

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  #                    22                         45                                               45
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  #                 thirty three             70357542478460                                   70357542478460
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  #                   [44]                   70357542478440                                   70357542478440
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
  #                    44                         89                                               89

  # No big surprise here...Ruby is re-using objects that have the same values...

end

fun_with_ids