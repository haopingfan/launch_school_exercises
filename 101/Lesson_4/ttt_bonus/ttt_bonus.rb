INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
MODE = 'choose' # options are "player", "computer", or "choose".

def prompt(message)
  puts "=> #{message}"
end

def display_board(brd, player_won, computer_won, tie_rounds)
  board_display = <<-MSG
=> You are a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.
   Whoever win 5 rounds first win the game!
   You won: #{player_won} rounds. Computer won: #{computer_won} rounds. Tie: #{tie_rounds} rounds.

     |     |
  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}
     |     |
-----+-----+-----
     |     |
  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}
     |     |
-----+-----+-----
     |     |
  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}
     |     |

MSG
  system('clear') || system('cls')
  puts board_display
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry,that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_win_square(marker, brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == marker && brd[line[1]] == marker && brd[line[2]] == INITIAL_MARKER
      return line[2]
    elsif brd[line[1]] == marker && brd[line[2]] == marker && brd[line[0]] == INITIAL_MARKER
      return line[0]
    elsif brd[line[0]] == marker && brd[line[2]] == marker && brd[line[1]] == INITIAL_MARKER
      return line[1]
    end
  end
  nil
end

def computer_places_piece!(brd)
  if find_win_square(COMPUTER_MARKER, brd)
    square = find_win_square(COMPUTER_MARKER, brd)
  elsif find_win_square(PLAYER_MARKER, brd)
    square = find_win_square(PLAYER_MARKER, brd)
  elsif brd[5] == INITIAL_MARKER
    square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "You win"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer wins"
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def joinor(arr, delimiter = ', ', conj = 'or')
  arr[-1] = "#{conj} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def place_piece!(board, current_player)
  if current_player == 'player'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  else
    'player'
  end
end

# Program Start
prompt "Welcome to Tic Tac Toe!"
loop do # loop to play again
  player_won = 0
  computer_won = 0
  tie_rounds = 0

  if MODE == 'choose'
    ans = nil
    loop do
      prompt "Who goes first? (1:player 2:computer)"
      ans = gets.chomp.to_i
      break if ans == 1 || ans == 2
      puts "Not valid, must be 1 or 2"
    end
  end

  loop do # loop to play 5 times
    board = initialize_board

    if MODE == 'player' || ans == 1
      current_player = 'player'
    elsif MODE == 'computer' || ans == 2
      current_player = 'computer'
    end

    loop do
      display_board(board, player_won, computer_won, tie_rounds)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if detect_winner(board) == 'You win'
      player_won += 1
    elsif detect_winner(board) == 'Computer wins'
      computer_won += 1
    else
      tie_rounds += 1
    end

    display_board(board, player_won, computer_won, tie_rounds)

    if someone_won?(board)
      prompt "#{detect_winner(board)} this round."
    else
      prompt "This round is a tie."
    end

    while player_won != 5 && computer_won != 5
      prompt "(press any key to continue)"
      any_key = gets
      break unless any_key.empty?
    end

    break if player_won == 5 || computer_won == 5
  end

  player_won == 5 ? prompt("You win the game!") : prompt("Computer wins the game.")

  answer = nil
  loop do
    prompt "Would you like to play again? (yes or no)"
    answer = gets.chomp.downcase
    break if answer == 'yes' || answer == 'no'
    prompt "Must be yes or no ..."
  end
  break if answer == 'no'
end

prompt "Thanks for playing Tic Tac Toe, Good bye!"
