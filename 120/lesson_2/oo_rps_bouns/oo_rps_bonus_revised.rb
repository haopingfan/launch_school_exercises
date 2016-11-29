class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard'].freeze
  NEMESIS = { 'rock' => ['paper', 'spock'], 'paper' => ['scissors', 'lizard'],
              'scissors' => ['rock', 'spock'], 'spock' => ['paper', 'lizard'],
              'lizard' => ['rock', 'scissors'] }.freeze

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def <(other_move)
    boolean = []
    NEMESIS.each_pair do |key, arr|
      boolean << (value == key && arr.include?(other_move.value))
    end
    boolean.any?
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    @history = []
    set_name
  end
end

class Human < Player
  VALUES_ABBR = { 'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors',
                  'sp' => 'spock', 'l' => 'lizard' }.freeze

  def set_name
    user_name = nil
    loop do
      puts 'Please enter your name: '
      user_name = gets.chomp.strip
      break unless user_name.empty?
      puts 'Must enter a value.'
    end
    self.name = user_name
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock(r), paper(p), scissors(sc), " \
           "spock(sp), lizard(l):"
      puts "(ex: You can type 'spock' or 'sp' to choose spock)"
      choice = gets.chomp.downcase
      choice = VALUES_ABBR[choice] if choice.length <= 2
      break if Move::VALUES.include? choice
      puts "Sorry, Invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  RULE_PERCENT = 0.4
  ADJUST_WEIGHT_HISTORY = 3
  ADJUST_WEIGHT_PERSONALITY = 3

  def set_name
    self.name = ['Number 9', 'R2D2', 'AI'].sample
  end

  def human_move_match_rule?(move, human_history)
    !human_history.empty? &&
      (human_history.count(move) / human_history.size) > RULE_PERCENT
  end

  def adjust_on_history(human_history)
    adjust_values = Move::VALUES
    Move::NEMESIS.each do |key, key_nemesis|
      next unless human_move_match_rule?(key, human_history)
      key_nemesis.each do |move|
        adjust_values += [move] * ADJUST_WEIGHT_HISTORY
      end
    end
    adjust_values
  end

  def adjust_on_personality(adjust_values)
    # 'R2D2' always choose rock.
    if name == 'R2D2'
      adjust_values = ['rock']
    # 'Number 9' have a very high tendency to choose "scissors",
    # and rarely "rock", but never "paper".
    elsif name == 'Number 9'
      adjust_values += ['scissors'] * ADJUST_WEIGHT_PERSONALITY
      adjust_values.delete('paper')
      adjust_values.delete('rock')
      adjust_values << 'rock'
    # 'AI' is totally objective, have no personal tendency.
    else
      adjust_values
    end
  end

  def adjust_values(human_history)
    adjust_values = adjust_on_history(human_history)
    adjust_on_personality(adjust_values)
  end

  def choose(human_history)
    self.move = Move.new(adjust_values(human_history).sample)
  end
end

# Game Orchestration Engine
class RPSGame
  MATCH_COMPLETE = 3
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Hi #{human.name}! Welcome to Rock, Paper, Scissors, Spock, Lizard."
    puts "Whoever wins #{MATCH_COMPLETE} rounds first wins the game."
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard. Good bye!"
  end

  def display_move
    puts "#{human.name} chose #{human.move.value}"
    puts "#{computer.name} chose #{computer.move.value}"
  end

  def display_winner_round
    if computer.move < human.move
      puts "#{human.name} wins this round!"
    elsif human.move < computer.move
      puts "#{computer.name} wins this round."
    else
      puts "It's a tie."
    end
  end

  def increment_score
    if computer.move < human.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def display_score
    puts "--------------------"
    puts "#{human.name}: won #{human.score} rounds."
    puts "#{computer.name}: won #{computer.score} rounds."
  end

  def display_winner_game
    if human.score == MATCH_COMPLETE
      puts "#{human.name} wins the game!"
    else
      puts "#{computer.name} wins the game!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts 'Sorry, must be y or n.'
    end
    answer == 'y'
  end

  def match_complete?
    human.score == MATCH_COMPLETE || computer.score == MATCH_COMPLETE
  end

  def clear_screen
    puts "(press any key to continue)"
    gets.chomp
    clear_screen_without_prompt
  end

  def clear_screen_without_prompt
    (system 'clear') || (system 'cls')
  end

  def score_reset
    human.score = 0
    computer.score = 0
  end

  def update_history
    human.history.push(human.move.value)
    computer.history.push(computer.move.value)
  end

  def display_history
    puts "#{human.name}'s history: #{human.history}"
    puts "#{computer.name}'s history: #{computer.history}"
  end

  def main_game
    loop do
      human.choose
      computer.choose(human.history)
      update_history
      display_move
      display_winner_round
      increment_score
      display_score
      break if match_complete?
      clear_screen
    end
  end

  def main_game_to_play_again
    loop do
      score_reset
      clear_screen_without_prompt
      main_game
      display_winner_game
      break unless play_again?
    end
  end

  def play
    display_welcome_message
    clear_screen
    main_game_to_play_again
    display_history
    display_goodbye_message
  end
end

RPSGame.new.play
