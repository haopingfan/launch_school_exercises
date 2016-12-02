class Board
  WINNING_LINES = [[1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 2, 3],
                   [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7]].freeze
  BOARD_CENTER = 5

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    (1..9).select { |key| @squares[key].unmarked? }.to_a
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def find_win_square(marker)
    WINNING_LINES.each do |line|
      if two_markers_and_one_empty_square?(line, marker)
        return empty_square_in(line)
      end
    end
    nil
  end

  def center_square
    BOARD_CENTER if @squares[5].unmarked?
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end

  def two_markers_and_one_empty_square?(line, marker)
    squares = @squares.values_at(*line)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 2
    markers.uniq == [marker]
  end

  def empty_square_in(line)
    empty_squares = @squares.select do |index, value|
      line.include?(index) && value.unmarked?
    end
    empty_squares.keys.first
  end
end

class Square
  INITIAL_MARKER = ' '.freeze
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :score, :marker, :name

  def initialize
    @marker = ''
    @score = 0
    @name = ''
  end
end

class TTTGame
  MATCH_COMPLETE = 3
  ONE_FOR_PLAYER = 1
  TWO_FOR_COMPUTER = 2

  attr_reader :board, :human, :computer, :first_mover

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
    @current_marker = ''
    @first_mover = ''
  end

  def play
    clear
    display_welcome_message
    user_setting
    loop do
      main_game
      display_game_result
      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  def main_game
    loop do
      display_board
      loop do
        current_player_moves
        break if board.full? || board.someone_won?
        clear_screen_and_display_board if human_turn?
      end
      increment_score
      display_round_result
      break if match_complete?
      reset
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe."
    puts "Whoever wins #{MATCH_COMPLETE} rounds wins the game."
    puts ""
  end

  def user_setting
    set_name
    set_marker
    set_goes_first
    clear
  end

  def set_name
    user_name = ''
    puts "Enter your name: "
    loop do
      user_name = gets.chomp.strip
      break unless user_name.empty?
      puts "Not valid, please enter again."
    end
    human.name = user_name
    computer.name = ['AI', 'R3D3', 'Number 9'].sample
  end

  def set_marker
    answer = nil
    puts "Choose your marker (X) for X, (O) for O: "
    loop do
      answer = gets.chomp.downcase
      break if %w(x o).include? answer
      puts "Sorry, must be X or O."
    end
    if answer == 'x'
      human.marker = 'X'
      computer.marker = 'O'
    else
      human.marker = 'O'
      computer.marker = 'X'
    end
  end

  def who_goes_first
    ans = nil
    puts "Who goes first? (1:player 2:computer)"
    loop do
      ans = gets.chomp.to_i
      puts ""
      break if ans == ONE_FOR_PLAYER || ans == TWO_FOR_COMPUTER
      puts "Not valid, must be 1 or 2"
    end
    ans
  end

  def set_goes_first
    ans = who_goes_first
    if ans == ONE_FOR_PLAYER
      @current_marker = human.marker
      @first_mover = human.marker
    elsif ans == TWO_FOR_COMPUTER
      @current_marker = computer.marker
      @first_mover = computer.marker
    end
  end

  def computer_moves
    square = board.find_win_square(computer.marker) ||
             board.find_win_square(human.marker) ||
             board.center_square ||
             board.unmarked_keys.sample
    board[square] = computer.marker
  end

  def display_game_result
    puts ""
    case MATCH_COMPLETE
    when human.score
      puts "Congrats! #{human.name} wins the game!"
    when computer.score
      puts "#{computer.name} wins the game."
    end
    puts ""
  end

  def increment_score
    case board.winning_marker
    when human.marker
      human.score += 1
    when computer.marker
      computer.score += 1
    end
  end

  def match_complete?
    human.score == MATCH_COMPLETE || computer.score == MATCH_COMPLETE
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe, Goodbye."
  end

  def clear
    system('clear') || system('cls')
  end

  def display_board
    puts "#{human.name} is a #{human.marker}." \
         " #{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Choose a square #{joinor(board.unmarked_keys)}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include? square
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  def joinor(arr, delimiter = ', ', conj = 'or')
    arr[-1] = "#{conj} #{arr.last}" if arr.size > 1
    arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
  end

  def display_round_winner
    case board.winning_marker
    when human.marker
      puts "#{human.name} wins this round!"
    when computer.marker
      puts "#{computer.name} wins this round."
    else
      puts "This round is a tie."
    end
  end

  def display_round_result
    clear_screen_and_display_board
    display_round_winner
    puts ""
    puts "#{human.name} won #{human.score} round."
    puts "#{computer.name} won #{computer.score} round."

    unless match_complete?
      puts ""
      puts "(press any key to continue)"
      gets
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n.'
    end
    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = first_mover
    clear

    if match_complete?
      human.score = 0
      computer.score = 0
    end
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_turn?
    @current_marker == human.marker
  end
end

game = TTTGame.new
game.play
