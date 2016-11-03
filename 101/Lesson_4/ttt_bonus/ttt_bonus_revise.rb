INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze
MODE = 'choose'.freeze # options are "player", "computer", or "choose".
FIVE_ROUNDS = 5
BOARD_CENTER = 5
ONE_FOR_PLAYER = 1
TWO_FOR_COMPUTER = 2

def prompt(message)
  puts "=> #{message}"
end

def remind_marker
  prompt "You are a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
end

def show_record(player_won, computer_won)
  prompt "Whoever win 5 rounds first win the game!
   You won: #{player_won} rounds. Computer won: #{computer_won} rounds."
end

def clear_screen
  system('clear') || system('cls')
end

def print_board(brd)
  board = <<-MSG
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
  puts board
end

def display_board(brd, player_won, computer_won)
  clear_screen
  remind_marker
  show_record(player_won, computer_won)
  print_board(brd)
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

# rubocop:disable MethodLength, Metrics/AbcSize
# rubocop:disable Metrics/PerceivedComplexity, Style/CyclomaticComplexity
def find_win_square(marker, brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == marker &&
       brd[line[1]] == marker &&
       brd[line[2]] == INITIAL_MARKER
      return line[2]
    elsif brd[line[1]] == marker &&
          brd[line[2]] == marker &&
          brd[line[0]] == INITIAL_MARKER
      return line[0]
    elsif brd[line[0]] == marker &&
          brd[line[2]] == marker &&
          brd[line[1]] == INITIAL_MARKER
      return line[1]
    end
  end
  nil
end
# rubocop:enable MethodLength, Metrics/AbcSize
# rubocop:enable Metrics/PerceivedComplexity, Style/CyclomaticComplexity

def computer_places_piece!(brd)
  square = find_win_square(COMPUTER_MARKER, brd) ||
           find_win_square(PLAYER_MARKER, brd) ||
           (BOARD_CENTER if brd[5] == INITIAL_MARKER) ||
           empty_squares(brd).sample
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

# rubocop:disable BlockLength
loop do # loop to play again
  player_won = 0
  computer_won = 0

  if MODE == 'choose'
    ans = nil
    loop do
      prompt "Who goes first? (1:player 2:computer)"
      ans = gets.chomp.to_i
      break if ans == ONE_FOR_PLAYER || ans == TWO_FOR_COMPUTER
      puts "Not valid, must be 1 or 2"
    end
  end

  loop do # loop to play 5 rounds
    board = initialize_board

    if MODE == 'player' || ans == ONE_FOR_PLAYER
      current_player = 'player'
    elsif MODE == 'computer' || ans == TWO_FOR_COMPUTER
      current_player = 'computer'
    end

    loop do
      display_board(board, player_won, computer_won)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if detect_winner(board) == 'You win'
      player_won += 1
    elsif detect_winner(board) == 'Computer wins'
      computer_won += 1
    end

    display_board(board, player_won, computer_won)

    if someone_won?(board)
      prompt "#{detect_winner(board)} this round."
    else
      prompt "This round is a tie."
    end

    while player_won != FIVE_ROUNDS && computer_won != FIVE_ROUNDS
      prompt "(press any key to continue)"
      any_key = gets
      break unless any_key.empty?
    end

    break if player_won == FIVE_ROUNDS || computer_won == FIVE_ROUNDS
  end

  if player_won == FIVE_ROUNDS
    prompt("You win the game!")
  else
    prompt("Computer wins the game.")
  end

  answer = nil
  loop do
    prompt "Would you like to play again? (yes or no)"
    answer = gets.chomp.downcase
    break if answer == 'yes' || answer == 'no'
    prompt "Must be yes or no ..."
  end
  break if answer == 'no'
end
# rubocop:enable BlockLength

prompt "Thanks for playing Tic Tac Toe, Good bye!"
