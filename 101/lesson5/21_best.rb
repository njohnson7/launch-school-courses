# 21_best.rb
# frozen_string_literal: true

POINTS_TO_WIN = 2
BUST_OR_WIN_VALUE = 21
DEALER_STAYS_VALUE = 17
SECONDS_TO_PAUSE_AFTER_WELCOME_MSG = 2
LARGE_ACE_VALUE = 11
SMALL_ACE_VALUE = 1
CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10,
  'Ace' => LARGE_ACE_VALUE
}.freeze
CLOSING_HASH_ROCKET = -' <='
WELCOME_MSG_WIDTH = 70
WELCOME_MSG_LINE = -(''.center(WELCOME_MSG_WIDTH, '-') + CLOSING_HASH_ROCKET)
WELCOME_MSG =
  -('Welcome to Twenty-One!'.center(WELCOME_MSG_WIDTH) + CLOSING_HASH_ROCKET)
HAND_WIDTH = 76
PLAYER_TURN_MSG = -'You get to go first!'
DEALER_TURN_MSG = -"Now it's the DEALER'S TURN!"
HIT_STAY_MSG =
  -"Would you like to hit or stay? (Type 'h' to hit, or 's' to stay)"
VALID_HIT_OR_STAY_INPUT = %w[h s].freeze
HIT_MSG = -'decided to HIT.      (Dealing card...)'
CALCULATING_RESULTS_MSG = -"......Calculating results......\n\n"
PLAYER_WINS_MSG =
  -"You are closer to #{BUST_OR_WIN_VALUE} so YOU WIN this round!"
DEALER_WINS_MSG =
  -"Dealer is closer to #{BUST_OR_WIN_VALUE} so DEALER WINS this round!"
TIE_MSG = -"It's a TIE!"
AGAIN_MSG = -'Would you like to play again? (y/n)'
AGAIN_MSG_WIDTH = AGAIN_MSG.size + 3
AGAIN_MSG_LINE = -"\n\n#{'=' * AGAIN_MSG_WIDTH}\n\n"
VALID_ROUND_END_INPUT = %w[y n].freeze
GOODBYE_MSG = -'Thank you for playing Twenty-One! Goodbye!'
GOODBYE_MSG_WIDTH = GOODBYE_MSG.size
GOODBYE_MSG_LINE = -''.center(GOODBYE_MSG_WIDTH, '-')
SEPARATOR_LINE_SIZE = 45
SEPARATOR_LINE = -"#{'_' * SEPARATOR_LINE_SIZE}\n\n"
DASH_LINE_SIZE = 45
DASH_LINE = -"\n#{'-' * DASH_LINE_SIZE}\n\n"

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
  arr = [arr[0...-1], "#{word} #{arr[-1]}"] if arr.size > 1
  arr.join(delimiter)
end

def display_welcome_msg
  clear_screen
  prompt WELCOME_MSG_LINE
  prompt WELCOME_MSG
  prompt WELCOME_MSG_LINE + "\n\n\n"
  SECONDS_TO_PAUSE_AFTER_WELCOME_MSG.times { pause }
  clear_screen
end

def display_round_num(round_num)
  clear_screen
  round_num_str = "Round #{round_num}!".center(SEPARATOR_LINE_SIZE)
  puts round_num_str
  puts SEPARATOR_LINE
end

def display_hand(hands, person, dealer_starting = false)
  person_str = person == :player ? 'Your hand:      ' : "Dealer's hand:  "
  hand = get_hand(hands, person)
  total_str = total_value_string(hands, person)
  hand, total_str = hide_dealer_start_card(hand, total_str) if dealer_starting
  hand_str = "  - #{person_str}#{joinor(hand, ', ', 'and')}"
  total_str = total_str.rjust(HAND_WIDTH - hand_str.size)

  puts "#{hand_str}#{total_str}"
end

def display_starting_hands(hands)
  dealer_starting = true

  prompt 'Starting hands:'
  display_hand(hands, :player)
  display_hand(hands, :dealer, dealer_starting)
end

def hide_dealer_start_card(hand, total_str)
  first_card = hand.first
  hidden_hand = [first_card, '?']
  first_card_value = CARD_VALUES.fetch(first_card)
  hidden_total_str = total_str.sub(/\d+/, "#{first_card_value} + ?")

  [hidden_hand, hidden_total_str]
end

def display_total(hands, person)
  puts "  - Total hand value:  #{gets_total(hands, person)}\n\n"
end

def display_player_goes_first_msg
  puts
  prompt PLAYER_TURN_MSG
end

def display_hit_msg(person)
  prompt "#{person_has_str(person)} #{HIT_MSG}"
end

def display_added_card(hands, person)
  prompt "Card dealt:         #{hands.fetch(person).last}"
end

def display_current_hand(hands, person)
  puts "  - Hand is now:       #{joinor(hands.fetch(person), ', ', 'and')}"
end

def display_stay_msg(hands, person)
  total = gets_total(hands, person)
  puts "\n"
  prompt "#{person_has_str(person)} decided to STAY at #{total}."
end

def display_dealer_turn_msg(hands)
  puts DASH_LINE
  prompt DEALER_TURN_MSG
  display_hand(hands, :dealer)
  puts
end

def display_bust_msg(person)
  person_strs = person == :player ? ['You have', 'LOSE'] : ['Dealer has', 'WIN']
  puts
  prompt format('%s busted so YOU %s this round!', *person_strs)
end

def display_round_winner(winner)
  puts "#{CALCULATING_RESULTS_MSG}\n"
  pause
  prompt case winner
         when :player then PLAYER_WINS_MSG
         when :dealer then DEALER_WINS_MSG
         else              TIE_MSG
         end
end

def display_results(hands, points)
  display_round_final_hands_and_totals(hands)
  display_round_points(points)
end

def display_round_final_hands_and_totals(hands)
  display_final_totals(hands)
  display_final_hands(hands)
end

def display_final_totals(hands)
  puts
  prompt 'Final total hand values:'
  puts "  - Your total:     #{gets_total(hands, :player)}"
  puts "  - Dealer total:   #{gets_total(hands, :dealer)}\n\n"
end

def display_final_hands(hands)
  prompt 'Final hands:'
  display_hand(hands, :player)
  display_hand(hands, :dealer)
end

def display_round_points(points)
  puts "\n"
  prompt 'Round points:'
  puts "  - Your points:    #{points[:player]} of #{POINTS_TO_WIN}"
  puts "  - Dealer points:  #{points[:dealer]} of #{POINTS_TO_WIN}"
end

def display_round_end_line
  pause
  puts SEPARATOR_LINE
end

def display_next_round_msg
  puts "\n\n"
  puts '......Starting next round.....'
  pause
end

def display_game_winner(points)
  winner = find_game_winner(points)
  winner_str = person_has_str(winner)

  puts "\n\n"
  puts SEPARATOR_LINE
  prompt "#{winner_str} WON the game with #{points[winner]} points!"
end

def display_goodbye_message
  clear_screen
  prompt GOODBYE_MSG_LINE
  prompt GOODBYE_MSG
  prompt GOODBYE_MSG_LINE
end

def total_value_string(hands, person)
  "(total value: #{gets_total(hands, person)})"
end

def person_has_str(person)
  person == :player ? 'You have' : 'Dealer has'
end

def choose_hit_or_stay
  prompt HIT_STAY_MSG
  loop do
    choice = gets.chomp.downcase
    return choice if VALID_HIT_OR_STAY_INPUT.include?(choice)
    prompt "Invalid choice. Please choose: #{joinor(VALID_HIT_OR_STAY_INPUT)}"
  end
end

def press_enter_next_round
  puts SEPARATOR_LINE
  prompt 'Press enter to begin next round.'
  gets
end

def choose_play_again
  puts AGAIN_MSG_LINE
  prompt AGAIN_MSG

  loop do
    again = gets.chomp.downcase
    return again if valid_again_response?(again)
    prompt "Invalid response. Please choose: #{joinor(VALID_ROUND_END_INPUT)}"
  end
end

def bust?(values_sum)
  values_sum > BUST_OR_WIN_VALUE
end

def large_ace?(values)
  values.include?(LARGE_ACE_VALUE)
end

def dealer_stays?(total)
  total >= DEALER_STAYS_VALUE
end

def game_over?(points)
  points.values.any? { |point| point >= POINTS_TO_WIN }
end

def valid_again_response?(again)
  VALID_ROUND_END_INPUT.include?(again)
end

def again?
  choose_play_again == 'y'
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

def add_card_to_hand(deck, hands, person)
  hands[person] << deal_card(deck)
end

def get_hand(hands, person)
  hands.fetch(person)
end

def cards_to_values(hands, person)
  hand = hands.fetch(person)
  hand.map { |card| CARD_VALUES[card] }
end

def values_sum(values)
  sum = values.reduce(:+)
  bust?(sum) && large_ace?(values) ? values_sum(shrink_ace(values)) : sum
end

def shrink_ace(values)
  first_large_ace_idx = values.index(LARGE_ACE_VALUE)

  values.delete_at(first_large_ace_idx)
  values.insert(first_large_ace_idx, SMALL_ACE_VALUE)
end

def gets_total(hands, person)
  values_sum(cards_to_values(hands, person))
end

def start_round
  deck = initialize_deck
  hands = initialize_hands(deck)

  [deck, hands]
end

def hit(deck, hands, person)
  puts
  add_card_to_hand(deck, hands, person)
  display_hit_msg(person)
  pause
  display_added_card(hands, person)
  display_current_hand(hands, person)
  display_total(hands, person)
end

def bust(hands, person, points)
  winner = person == :player ? :dealer : :player
  increment_points(points, winner)

  display_round_end_line
  display_bust_msg(person)
  display_results(hands, points)
end

def find_round_winner(hands)
  dealer_total = gets_total(hands, :dealer)
  player_total = gets_total(hands, :player)

  case player_total <=> dealer_total
  when 1  then :player
  when -1 then :dealer
  else         :tie
  end
end

def find_game_winner(points)
  points[:player] > points[:dealer] ? :player : :dealer
end

def increment_points(points, winner)
  points[winner] += 1 unless winner == :tie
end

def player_turn(deck, hands)
  display_player_goes_first_msg

  loop do
    hit_stay = choose_hit_or_stay
    return :stay if hit_stay == 's'
    hit(deck, hands, :player)
    total = gets_total(hands, :player)
    return :bust if bust?(total)
  end
end

def dealer_turn(deck, hands)
  display_dealer_turn_msg(hands)

  loop do
    total = gets_total(hands, :dealer)
    return :bust if bust?(total)
    return :stay if dealer_stays?(total)
    hit(deck, hands, :dealer)
  end
end

def play_round(points, round_num)
  deck, hands = start_round

  display_round_num(round_num)
  display_starting_hands(hands)

  bust_or_stay = player_turn(deck, hands)
  if bust_or_stay == :bust then bust(hands, :player, points)
  else                          continue_round(deck, hands, points)
  end
end

def continue_round(deck, hands, points)
  display_stay_msg(hands, :player)

  bust_or_stay = dealer_turn(deck, hands)
  if bust_or_stay == :bust
    bust(hands, :dealer, points)
  else
    display_stay_msg(hands, :dealer)
    round_end(hands, points)
  end
end

def round_end(hands, points)
  winner = find_round_winner(hands)
  increment_points(points, winner)

  display_round_end_line
  display_round_winner(winner)
  display_results(hands, points)
end

def start_next_round
  press_enter_next_round
  display_next_round_msg
end

def play_game(points)
  round_num = 0
  loop do
    round_num += 1
    play_round(points, round_num)
    return if game_over?(points)
    start_next_round
  end
end

def main_game
  display_welcome_msg
  loop do
    points = { player: 0, dealer: 0 }
    play_game(points)
    display_game_winner(points)
    break unless again?
  end
  display_goodbye_message
end

main_game
