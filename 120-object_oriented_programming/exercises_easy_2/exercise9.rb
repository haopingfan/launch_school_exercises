class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
  def play
    "play in Bingo class"
  end
end

# What would happen if we added a play method to the Bingo class, 
# keeping in mind that there is already a method of this name in 
# the Game class that the Bingo class inherits from.

# if we add a play method to the Bingo class, 
# whenever the instance of Bingo class call the play method,
# it will call the play in Bingo class, not the play in Game class.

bingo = Bingo.new
bingo.play #=> "play in Bingo class"