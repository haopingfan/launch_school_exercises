# What do you expect to happen when the greeting variable is referenced 
# in the last line of the code below?

if false
  greeting = “hello world”
end

greeting


# nothing will happen, no exception will be raised, since the greeting is initialized
# to boolean value: nil, even the if statement not get executed.