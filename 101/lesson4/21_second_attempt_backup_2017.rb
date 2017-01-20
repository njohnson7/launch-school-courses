# 21_second_attempt_backup_2017.rb

# 21_second_attempt.rb
# frozen_string_literal: true

# TODO: FIX TOTAL POINTS METHODS/REDUNDANCY

LARGE_ACE_VALUE = 11
SMALL_ACE_VALUE = 1
BUST_VALUE = 21
DEALER_MAX_VALUE = 17
CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10,
  'Ace' => LARGE_ACE_VALUE
}.freeze
CLOSING_HASH_ROCKET = ' <='
WELCOME_MSG_WIDTH = 70
WELCOME_MSG_LINE = ''.center(WELCOME_MSG_WIDTH, '-') + CLOSING_HASH_ROCKET
WELCOME_MSG = 'Welcome to Twenty-One!'.center(WELCOME_MSG_WIDTH) +
               CLOSING_HASH_ROCKET
GOODBYE_MSG = 'Thank you for playing Twenty-One! Goodbye!'
GOODBYE_MSG_WIDTH = GOODBYE_MSG.size
GOODBYE_MSG_LINE = ''.center(GOODBYE_MSG_WIDTH, '-')
AGAIN_MSG = 'Would you like to play again? (y/n)'
AGAIN_MSG_WIDTH = AGAIN_MSG.size + 3

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def pause
  sleep(1)
end

def joinor(arr, delimiter = ', ', word = 'or')
  last = arr.last.to_s
  last_regex = /(?<=#{delimiter})#{last}/
  arr.join(delimiter).sub(last_regex, "#{word} #{last}")
end

def display_welcome_msg
  clear_screen
  prompt WELCOME_MSG_LINE
  prompt WELCOME_MSG
  prompt WELCOME_MSG_LINE + "\n\n\n"
end

def display_goodbye_message
  clear_screen
  prompt GOODBYE_MSG_LINE
  prompt GOODBYE_MSG
  prompt GOODBYE_MSG_LINE
end

def initialize_deck
  (CARD_VALUES.keys * 4).shuffle
end

def deal_card(deck)
  deck.shift
end

def deal_first_two_cards(deck)
  [deal_card(deck), deal_card(deck)]
end

def initialize_hand(deck)
  deal_first_two_cards(deck)
end

def initialize_hands(deck)
  { player: initialize_hand(deck), dealer: initialize_hand(deck) }
end

def player_hand(hands)
  hands.fetch(:player)
end

def display_player_hand(hands)
  puts "  - Your hand:      #{joinor(player_hand(hands), ', ', 'and')}" \
       "        #{total_value_string(hands, :player)}"
end

def dealer_hand(hands)
  hands.fetch(:dealer)
end

def display_dealer_hand(hands)
  puts "  - Dealer's hand:  #{joinor(dealer_hand(hands), ', ', 'and')}" \
       "        #{total_value_string(hands, :dealer)}"
end

def display_dealer_starting_hand(hands)
  first_card = dealer_hand(hands).first
  puts "  - Dealer's hand:  #{first_card} and <unknown card>" \
       "        (total value: #{CARD_VALUES.fetch(first_card)} + ?)"
end

def display_starting_hands(hands)
  prompt 'Starting hands:'
  display_player_hand(hands)
  display_dealer_starting_hand(hands)
end

def start_round
  deck = initialize_deck
  hands = initialize_hands(deck)

  [deck, hands]
end

def add_card_to_hand(deck, hands, person)
  hands[person] << deal_card(deck)
end

def display_added_card(hands, person)
  prompt "Card dealt:         #{hands.fetch(person).last}"
end

def display_current_hand(hands, person)
  puts "  - Hand is now:       #{joinor(hands.fetch(person), ', ', 'and')}"
end

def hit(deck, hands, person)
  puts
  add_card_to_hand(deck, hands, person)
  display_added_card(hands, person)
  display_current_hand(hands, person)
  display_total(hands, person)
end

def cards_to_values(hands, person)
  values = []
  hand = hands.fetch(person)
  hand.each do |card|
    CARD_VALUES.each do |c, val|
      values << val if c == card
    end
  end

  values
end

def values_sum(values)
  sum = values.reduce(:+)
  sum = values_sum(shrink_ace(values)) if bust?(sum) && large_ace?(values)

  sum
end

def bust?(values_sum)
  values_sum > BUST_VALUE
end

def large_ace?(values)
  values.include?(LARGE_ACE_VALUE)
end

def shrink_ace(values)
  first_large_ace_idx = values.index(LARGE_ACE_VALUE)

  values.delete_at(first_large_ace_idx)
  values.insert(first_large_ace_idx, SMALL_ACE_VALUE)
end

def gets_total(hands, person)
  values_sum(cards_to_values(hands, person))
end

def total_value_string(hands, person)
  "(total value: #{gets_total(hands, person)})"
end

def player_total(hands)
  values_sum(cards_to_values(hands, :player))
end

def dealer_total(hands)
  values_sum(cards_to_values(hands, :dealer))
end

def display_total(hands, person)
  puts "  - Total hand value:  #{gets_total(hands, person)}"
end

def display_stay_msg(person)
  if person == :player
    puts
    prompt 'You have decided to stay.'
  else
    puts
    prompt 'Dealer has decided to stay.'
  end
end

def display_bust_msg(person)
  if person == :player
    puts
    prompt 'You have busted so you lose!'
  else
    puts
    prompt 'Dealer has busted so you win!'
  end
end

def bust(hands, person)
  pause
  puts "\n" + '_____________________________________________' + "\n"
  display_bust_msg(person)
  display_round_final_hands_and_totals(hands)
end

def display_final_totals(hands)
  prompt 'Final total hand values:'
  puts "  - Your total:     #{player_total(hands)}"
  puts "  - Dealer total:   #{dealer_total(hands)}"
end

def display_final_hands(hands)
  prompt 'Final hands:'
  display_player_hand(hands)
  display_dealer_hand(hands)
end

def display_round_final_hands_and_totals(hands)
  puts
  display_final_totals(hands)
  puts
  display_final_hands(hands)
end

def find_round_winner(hands)
  dealer_total = gets_total(hands, :dealer)
  player_total = gets_total(hands, :player)

  if dealer_total > player_total then 'dealer'
  elsif player_total > dealer_total then 'player'
  else 'tie'
  end
end

def display_round_winner(winner)
  if winner == 'dealer'
    prompt 'Dealer is closer to 21 so he has won!'
  elsif winner == 'player'
    prompt 'You are closer to 21 so you won!'
  else
    prompt "It's a tie!"
  end
end

def round_end(hands)
  pause
  puts "\n" + '_____________________________________________' + "\n\n"

  winner = find_round_winner(hands)

  display_round_winner(winner)
  display_round_final_hands_and_totals(hands)
end

def choose_hit_or_stay
  prompt "Would you like to hit or stay? (Type 'h' to hit, or 's' to stay)"
  loop do
    choice = gets.chomp.downcase
    return choice if %w(h s).include?(choice)
    prompt "Invalid choice. Please choose: #{joinor(%w(h s))}"
  end
end

def player_turn(deck, hands)
  puts
  prompt 'You get to go first!'

  loop do
    hit_stay = choose_hit_or_stay
    return 'stay' if hit_stay == 's'
    pause
    hit(deck, hands, :player)
    total = gets_total(hands, :player)
    return 'bust' if bust?(total)
  end
end

def dealer_hit_or_stay(total)
  total < DEALER_MAX_VALUE ? 'hit' : 'stay'
end

def dealer_turn(deck, hands)
  puts '______________________________' + "\n\n"
  prompt "Now it's the dealer's turn!"
  display_dealer_hand(hands)
  puts

  loop do
    total = gets_total(hands, :dealer)
    return 'bust' if bust?(total)
    return 'stay' if dealer_hit_or_stay(total) == 'stay'
    prompt 'Dealer has decided to hit.'
    pause
    hit(deck, hands, :dealer)
  end
end

def play_round
  deck, hands = start_round
  display_starting_hands(hands)

  bust_or_stay = player_turn(deck, hands)
  if bust_or_stay == 'bust'
    bust(hands, :player)
  else
    continue_round(deck, hands)
  end
end

def continue_round(deck, hands)
  display_stay_msg(:player)

  bust_or_stay = dealer_turn(deck, hands)
  if bust_or_stay == 'bust'
    bust(hands, :dealer)
  else
    display_stay_msg(:dealer)
    round_end(hands)
  end
end

def play_game
  loop do
    play_round
    break unless again?
    clear_screen
  end
end

def valid_again_response?(again)
  %(y n).include?(again)
end

def again_choice
  puts "\n" + ''.center(AGAIN_MSG_WIDTH, '=') + "\n\n"
  prompt AGAIN_MSG

  loop do
    again = gets.chomp.downcase
    return again if valid_again_response?(again)
    prompt "Invalid response. Please choose: #{joinor(%w(y n))}"
  end
end

def again?
  again_choice == 'y'
end

display_welcome_msg
play_game
display_goodbye_message
