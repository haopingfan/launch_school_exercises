def prompt(message)
  puts "=> #{message}"
end

def converter(choice)
  case choice
  when 1
    'Rock'
  when 2
    'Paper'
  when 3
    'Scissors'
  when 4
    'Spock'
  when 5
    'Lizard'
  end
end

def player1_score?(player1, player2)
  player1 - player2 == 1 ||
    player1 - player2 == -4 ||
    player1 - player2 == -2 ||
    player1 - player2 == 3
end

def win?(user_point, computer_point)
  if user_point == 5
    "Congrats! You won the game!"
  elsif computer_point == 5
    "Sorry, Computer won the game."
  end
end

# Program Start
welcome = <<-message
Welcome to Rock Paper Scissors game!
  (whoever reaches 5 points first wins.)
------------------------------------------
message
prompt(welcome)

# main loop to play agian
loop do
  # whoever reaches 5 points first wins
  user_point = 0
  computer_point = 0

  loop do
    # user's choice
    prompt_user = <<-message
Make your chocie:
  1:Rock
  2:Paper
  3:Scissors
  4:Spock
  5:Lizard
message
    prompt(prompt_user)

    user_choice = nil
    loop do
      user_choice = gets.chomp.to_i
      if [1, 2, 3, 4, 5].include?(user_choice)
        break
      else
        prompt("Hmm.. not a valid number, plz enter 1, 2, 3, 4, 5")
      end
    end

    # computer's choice
    computer_choice = 1 + Random.rand(5)

    # the result
    result = if player1_score?(user_choice, computer_choice)
               "You score! "
             elsif player1_score?(computer_choice, user_choice)
               "Computer scores. "
             else
               "It's a tie. "
             end

    # incrementing point
    if player1_score?(user_choice, computer_choice)
      user_point += 1
    elsif player1_score?(computer_choice, user_choice)
      computer_point += 1
    end

    # display result
    display_user = converter(user_choice)
    display_computer = converter(computer_choice)

    prompt_result = <<-message
Your choice is #{display_user}, Computer's choice is #{display_computer}.
   #{result} Your point: #{user_point} ; Computer's point: #{computer_point}
message
    prompt(prompt_result)

    break if win?(user_point, computer_point)
  end
  prompt("-------------------------------------------------------")
  prompt(win?(user_point, computer_point))

  # prompt to ask user if want to play agian
  prompt("Would you like to play again? (Yes to play, No to leave)")
  play_again = nil
  loop do
    play_again = gets.chomp.downcase
    if play_again == 'yes' || play_again == 'no'
      break
    else
      prompt("Not valid, must be yes or no")
    end
  end
  break if play_again == 'no'
end

prompt("Thanks for playing this game, Goodbye!")
