# Predict how the values and object ids will change 
# throughout the flow of the code below:

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
  #                 forty two                70334267995020
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  #                   [42]                   70334267995000
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"
  #                    42                         85

  # Notice that Ruby re-used the "42 object with id 85" when the value was the same.

  1.times do
    a_outer_inner_id = a_outer.object_id 
    b_outer_inner_id = b_outer.object_id 
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block." 
    #                          85                                       85             PS: inner block can access variable declared outside block
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block." 
    #                    70334267995020                            70334267995020      PS: inner block can access variable declared outside block
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block." 
    #                    70334267995000                            70334267995000      PS: inner block can access variable declared outside block
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block.\n\n" 
    #                          85                                       85             PS: inner block can access variable declared outside block

    # Notice that Ruby did NOT change the id for any of the objects between outside and inside the block

    a_outer = 22              
    b_outer = "thirty three"   
    c_outer = [44]             
    d_outer = c_outer[0]      

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after." 
    #                                              22                          85                            45          PS: inner block can access variable declared outside block, and change the value
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after." 
    #                                         thirty three                70334267995020                70334267994300   PS: inner block can access variable declared outside block, and change the value
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after." 
    #                                             [44]                    70334267995000                70334267994280   PS: inner block can access variable declared outside block, and change the value
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n" 
    #                                              44                          85                            89          PS: inner block can access variable declared outside block, and change the value

    # Notice that changing the values has forced Ruby to create new objects and refer to them with the original variable names.

    a_inner = a_outer         
    b_inner = b_outer        
    c_inner = c_outer        
    d_inner = c_inner[0]     

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id 
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)." 
    #                     22                         45                                           45
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)." 
    #                 thirty three             70334267994300                                 70334267994300
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)." 
    #                    [44]                  70334267994280                                 70334267994280
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer).\n\n"
    #                     44                         89                                           89 

  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block." 
  #                     22                         85                           45                              PS: variable declare outside block and change value inside block can be access
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  #                 thirty three             70334267995020               70334267994300                        PS: variable declare outside block and change value inside block can be access
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block." 
  #                    [44]                  70334267995000               70334267994280                        PS: variable declare outside block and change value inside block can be access
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block.\n\n" 
  #                     44                         85                           89                              PS: variable declare outside block and change value inside block can be access

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"  # "ugh ohhhhh"
  #                            variable declare inside block can't be access 
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"  # "ugh ohhhhh"
  #                            variable declare inside block can't be access
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"  # "ugh ohhhhh"
  #                            variable declare inside block can't be access
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"  # "ugh ohhhhh"
  #                            variable declare inside block can't be access
end

fun_with_ids