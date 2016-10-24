def prompt(message)
  puts "=> #{message}"
end

def choice_for_display(choice)
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

def score?(player1, player2)
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

welcome = <<-MSG
Welcome to Rock Paper Scissors game!
  (whoever reaches 5 points first wins.)
------------------------------------------
MSG
prompt(welcome)

# main loop to play agian
loop do
  user_point = 0
  computer_point = 0

  # loop to increment the score
  loop do
    prompt_user = <<-MSG
Make your chocie:
  1:Rock
  2:Paper
  3:Scissors
  4:Spock
  5:Lizard
MSG
    prompt(prompt_user)

    user_choice = nil
    loop do
      user_choice = gets.chomp.to_i
      break if [1, 2, 3, 4, 5].include?(user_choice)
      prompt("Hmm.. not a valid number, plz enter 1, 2, 3, 4, 5")
    end

    computer_choice = rand(1..5)

    result = if score?(user_choice, computer_choice)
               "You score! "
             elsif score?(computer_choice, user_choice)
               "Computer scores. "
             else
               "It's a tie. "
             end

    if score?(user_choice, computer_choice)
      user_point += 1
    elsif score?(computer_choice, user_choice)
      computer_point += 1
    end

    display_user = choice_for_display(user_choice)
    display_computer = choice_for_display(computer_choice)

    system('clear') || system('cls')
    prompt_result = <<-MSG
Your choice is #{display_user}, Computer's choice is #{display_computer}.
   #{result} Your point: #{user_point} ; Computer's point: #{computer_point}
MSG
    prompt(prompt_result)

    break if win?(user_point, computer_point)
  end
  prompt("-------------------------------------------------------")
  prompt(win?(user_point, computer_point))

  prompt("Would you like to play again? (Yes to play, No to leave)")
  play_again = nil
  loop do
    play_again = gets.chomp.downcase
    break if play_again == 'yes' || play_again == 'no'
    prompt("Not valid, must be yes or no")
  end
  break if play_again == 'no'
  system('clear') || system('cls')
end

prompt("Thanks for playing this game, Goodbye!")
