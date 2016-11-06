CARD_SUITS =  ['S', 'H', 'D', 'C'].freeze
CARD_VALUES = (('2'..'10').to_a + ['A', 'J', 'Q', 'K']).freeze

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  CARD_SUITS.product(CARD_VALUES).shuffle
end

def arr_interpolation(arr)
  string = ''
  arr.each_with_index do |item, index|
    string << item.to_s
    string << ', ' unless arr.size == (index + 1)
  end
  string
end

def show_player_cards(player_cards)
  message = <<-MSG
Your total value: #{total_value(player_cards)}
   You have #{arr_interpolation(player_cards)}.
  MSG
  prompt message
end

def show_dealer_cards(dealer_cards)
  prompt "Dealer has #{dealer_cards.first} and one unknown."
end

def value_converter(value)
  if %w(J Q K).include?(value)
    10
  elsif value == 'A'
    11
  else
    value.to_i
  end
end

def total_value(cards)
  values = cards.map { |card| card[1] }
  sum = 0
  values.each do |value|
    sum += value_converter(value)
  end

  # correct for Aces
  num_ace = values.count('A')
  while num_ace > 0
    sum -= 10 if sum > 21
    num_ace -= 1
  end
  sum
end

def bust?(cards)
  total_value(cards) > 21
end

def detect_result(player_cards, dealer_cards)
  if bust?(player_cards)
    :player_bust
  elsif bust?(dealer_cards)
    :dealer_bust
  elsif total_value(player_cards) > total_value(dealer_cards)
    :player_win
  elsif total_value(player_cards) < total_value(dealer_cards)
    :dealer_win
  else
    :tie
  end
end

def display_result(player_cards, dealer_cards)
  result = detect_result(player_cards, dealer_cards)
  msg = case result
        when :player_bust
          "You busted! Dealer wins!"
        when :dealer_bust
          "Dealer busted! You win!"
        when :player_win
          "You win!"
        when :dealer_win
          "Dealer wins!"
        when :tie
          "It's a tie!"
        end
  prompt msg
end

def show_dealer_total_value(dealer_cards)
  message = <<-MSG
Dealer's total value: #{total_value(dealer_cards)}
   Dealer has #{arr_interpolation(dealer_cards)}.
  MSG
  prompt message
end

def gets_answer
  ans = nil
  loop do
    ans = gets.chomp
    break if ans == '1' || ans == '2'
    prompt "Not valid, must be 1 or 2."
  end
  ans
end

def print_delimiter
  prompt "---------------------------"
end

def play_again?
  prompt "Play again? (1:yes, 2:no)"
  gets_answer == '1'
end

# --------- program start ------------

# rubocop: disable Metrics/BlockLength
loop do
  card_deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # mutate the card_deck, so that won't get the same card
  # cards have been shuffled when initialized
  2.times do
    player_cards << card_deck.pop
    dealer_cards << card_deck.pop
  end

  loop do
    system('clear') || system('cls')
    prompt "Welcome to Twenty-One!"
    print_delimiter

    show_player_cards(player_cards)
    show_dealer_cards(dealer_cards)
    break if bust?(player_cards)

    prompt "Hit or stay? (1:hit, 2:stay)"
    ans = gets_answer
    break if ans == '2'
    player_cards << card_deck.pop
  end

  print_delimiter
  if bust?(player_cards)
    display_result(player_cards, dealer_cards)
    play_again? ? next : break
  else
    prompt "Dealer turn..."
  end

  while total_value(dealer_cards) < 17
    dealer_cards << card_deck.pop
    prompt "Dealer hits a #{dealer_cards.last}."
  end
  prompt "Dealer stays." unless bust?(dealer_cards)

  show_dealer_total_value(dealer_cards)
  print_delimiter
  display_result(player_cards, dealer_cards)

  break unless play_again?
end
# rubocop: enable Metrics/BlockLength

prompt "Thanks for playing Twenty-One! Goodbye!"
