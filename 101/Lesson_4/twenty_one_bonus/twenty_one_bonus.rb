SUITS = %w(H D S C).freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
MAX_NUM = 21
DEALER_THRESHOLD = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def value_converter(value)
  if value == 'A'
    11
  elsif value.to_i.zero? # J, Q, K
    10
  else
    value.to_i
  end
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += value_converter(value)
  end

  # correct for Aces
  values.count('A').times do
    sum -= 10 if sum > MAX_NUM
  end

  sum
end

def busted?(cards)
  total(cards) > MAX_NUM
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > MAX_NUM
    :player_busted
  elsif dealer_total > MAX_NUM
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt 'You busted! Dealer wins this round!'
  when :dealer_busted
    prompt 'Dealer busted! You win this round!'
  when :player
    prompt 'You win this round!'
  when :dealer
    prompt 'Dealer wins this round!'
  when :tie
    prompt 'This round is a tie!'
  end
end

def play_again?
  puts '-------------'
  prompt 'Do you want to play again? (y or n)'
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    prompt 'Not valid, must be y or n'
  end
  answer == 'y'
end

def press_to_continue
  prompt '(Press any key to continue...)'
  gets
end

def win_five_rounds?(player_won, dealer_won)
  player_won == 5 || dealer_won == 5
end

def end_of_round_output(dealer_cards, player_cards)
  puts '=============='
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts '=============='
end

# -------- program start ------------

# loop to play again
# rubocop: disable Metrics/BlockLength
loop do
  # loop to play five rounds
  player_won = 0
  dealer_won = 0

  loop do
    system('clear') || system('cls')
    msg = <<-MSG
Welcome to Twenty-One!
   Who wins 5 rounds first wins the game!
   Player won #{player_won} rounds / Dealer won #{dealer_won} rounds
    MSG
    prompt msg

    # initialize vars
    deck = initialize_deck
    player_cards = []
    dealer_cards = []

    # initial deal
    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    prompt "Dealer has #{dealer_cards[0]} and ?"
    print "=> You have: #{player_cards[0]} and #{player_cards[1]}, "
    puts "for a total of #{total(player_cards)}."

    # player turn
    loop do
      player_turn = nil
      loop do
        prompt 'Would you like to (h)it or (s)tay?'
        player_turn = gets.chomp.downcase
        break if %w(h s).include?(player_turn)
        prompt "Sorry, must enter 'h' or 's'."
      end

      if player_turn == 'h'
        player_cards << deck.pop
        prompt 'You chose to hit!'
        prompt "Your cards are now: #{player_cards}"
        prompt "Your total is now: #{total(player_cards)}"
      end

      break if player_turn == 's' || busted?(player_cards)
    end

    if busted?(player_cards)
      end_of_round_output(dealer_cards, player_cards)
      display_result(dealer_cards, player_cards)
      dealer_won += 1
      break if win_five_rounds?(player_won, dealer_won)
      press_to_continue
      next
    else
      prompt "You stayed at #{total(player_cards)}"
    end

    # dealer turn
    prompt 'Dealer turn...'

    loop do
      break if busted?(dealer_cards) || total(dealer_cards) >= DEALER_THRESHOLD

      prompt 'Dealer hits!'
      dealer_cards << deck.pop
      prompt "Dealer's cards are now: #{dealer_cards}"
    end

    if busted?(dealer_cards)
      prompt "Dealer total is now: #{total(dealer_cards)}"
      end_of_round_output(dealer_cards, player_cards)
      display_result(dealer_cards, player_cards)
      player_won += 1
      break if win_five_rounds?(player_won, dealer_won)
      press_to_continue
      next
    else
      prompt "Dealer stays at #{total(dealer_cards)}"
    end

    # both player and dealer stays - compare cards!
    end_of_round_output(dealer_cards, player_cards)
    display_result(dealer_cards, player_cards)

    case detect_result(dealer_cards, player_cards)
    when :player
      player_won += 1
    when :dealer
      dealer_won += 1
    end

    break if win_five_rounds?(player_won, dealer_won)
    press_to_continue
  end

  if player_won == 5
    prompt 'You won 5 rounds. You win the game!'
  else
    prompt 'Dealer won 5 rounds. Dealer wins the game!'
  end

  break unless play_again?
end
# rubocop: enable Metrics/BlockLength

prompt 'Thank you for playing Twenty-One! Good bye!'