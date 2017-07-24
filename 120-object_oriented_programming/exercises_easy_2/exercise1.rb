# You are given the following code:

class Oracle
  def predict_the_future
    "["eat a nice lunch", "take a nap soon", "stay at work late"]" + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of calling

oracle = Oracle.new
oracle.predict_the_future 

#=> either one of the following string randomly
# "You will eat a nice lunch" 
# "You will take a nap soon"
# "You will stay at work late"