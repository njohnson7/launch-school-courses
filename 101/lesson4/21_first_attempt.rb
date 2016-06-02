# 21_first_attempt.rb
# frozen_string_literal: true

# DECK = {
#   hearts: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'],
#   diamonds: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'],
#   clubs: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'],
#   spades: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
# }.freeze

# cards = []
# 4.times do
#   ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |card|
#       cards << card
#     end
# end
# cards.sort!
# cards.delete('10')
# 4.times { cards.insert(32, '10') }
# queens = cards.pop(4)
# cards.insert(44, *queens)
# cards.delete('A')
# 4.times { cards << 'A' }

require 'pry'

LARGE_ACE_VALUE = 11
SMALL_ACE_VALUE = 1

# deck = ['2', '2', '2', '2', '3', '3', '3', '3', '4', '4', '4', '4', '5', '5',
#         '5', '5', '6', '6', '6', '6', '7', '7', '7', '7', '8', '8', '8', '8',
#         '9', '9', '9', '9', '10', '10', '10', '10', 'J', 'J', 'J', 'J', 'Q',
#         'Q', 'Q', 'Q', 'K', 'K', 'K', 'K', 'A', 'A', 'A', 'A']

VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => LARGE_ACE_VALUE
}

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(ary, delimiter = ', ', word = 'or')
  ary = ary.dup
  ary[-1] = "#{word} #{ary.last}" if ary.size > 1
  ary.size == 2 ? ary.join(' ') : ary.join(delimiter)
end

def initialize_deck
  ['2', '2', '2', '2', '3', '3', '3', '3', '4', '4', '4', '4', '5', '5',
   '5', '5', '6', '6', '6', '6', '7', '7', '7', '7', '8', '8', '8', '8',
   '9', '9', '9', '9', '10', '10', '10', '10', 'J', 'J', 'J', 'J', 'Q',
   'Q', 'Q', 'Q', 'K', 'K', 'K', 'K', 'A', 'A', 'A', 'A']
end

def shuffle(deck)
  # TODO: add cut method?
  deck.shuffle!
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

def display_player_hand(hands)
  puts " - You have:    #{joinor(hands.fetch(:player), ', ', 'and')}"
end

def display_dealer_starting_hand(hands)
  puts " - Dealer has:  #{hands.fetch(:dealer).first} and an unknown card"
end

def display_starting_hands(hands)
  prompt 'Starting hands:'
  display_player_hand(hands)
  display_dealer_starting_hand(hands)
end

def start_round
  deck = initialize_deck
  shuffle(deck)
  hands = initialize_hands(deck)

  [deck, hands]
end

def choose_hit_or_stay
  prompt "Would you like to hit or stay? (Type 'h' to hit, or 's' to stay)"
  loop do
    choice = gets.chomp.downcase
    return choice if %w(h s).include?(choice)
    prompt "Invalid choice. Please choose: #{joinor(%w(h s))}"
  end
end

def add_card_to_hand(deck, hands, person)
  hands[person] << deal_card(deck)
end

def display_added_card(hands, person)
  prompt "Card dealt:        #{hands.fetch(person).last}"
end

def display_current_hand(hands, person)
  puts " - Hand is now:       #{joinor(hands.fetch(person), ', ', 'and')}"
end

def display_total(hands, person)
  puts " - Total hand value:  #{gets_total(hands, person)}"
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
    VALUES.each do |c, val|
      values << val if c == card
    end
  end

  values
end

def values_sum(values)
  sum = values.reduce(:+)
  sum = values_sum(convert_ace(values)) if bust?(sum) && has_large_ace?(values)

  sum
end

def bust?(values_sum)
  values_sum > 21
end

def has_large_ace?(values)
  values.include?(LARGE_ACE_VALUE)
end

def convert_ace(values)
  first_large_ace_idx = values.index(LARGE_ACE_VALUE)
  values.delete_at(first_large_ace_idx)
  values.insert(first_large_ace_idx, SMALL_ACE_VALUE)
end

def gets_total(hands, person)
  values_sum(cards_to_values(hands, person))
end

def player_turn(deck, hands)
  puts
  prompt "You get to go first!"
  loop do
    hit_stay = choose_hit_or_stay
    return 'stay' if hit_stay == 's'
    hit(deck, hands, :player)
    total = gets_total(hands, :player)
    return 'bust' if bust?(total)
  end
end

def dealer_hit_or_stay(total)
  total < 17 ? 'hit' : 'stay'
end

def dealer_turn(deck, hands)
  puts '____________________________' + "\n\n"
  prompt "Now it's the dealer's turn!"
  loop do
    total = gets_total(hands, :dealer)
    return 'stay' if dealer_hit_or_stay(total) == 'stay'
    hit(deck, hands, :dealer)
    return 'bust' if bust?(total)
  end
end

def display_bust_msg(person)
  if person == :player
    puts
    prompt 'You have busted!' + "\n"
  else
    puts
    prompt 'Dealer has busted!' + "\n"
  end
end

def display_dealer_final_hand(hands)
  puts " - Dealer has:  #{joinor(hands.fetch(:dealer), ', ', 'and')}"
end

def display_final_hands(hands)
  prompt 'Final hands:'
  display_player_hand(hands)
  display_dealer_final_hand(hands)
end

def display_final_totals(hands)
  prompt 'Final total hand values:'
  # hands.each_key { |person| display_total(hands, person) }
  display_total(hands, :player)
  display_total(hands, :dealer)
end

def display_round_result(hands)
  puts '_______________________________' + "\n\n"
  display_final_hands(hands)
  puts
  display_final_totals(hands)
  display_round_winner(hands)
end

def bust(hands, person)
  display_bust_msg(person)
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

def find_round_winner(hands)
  dealer_total = gets_total(hands, :dealer)
  player_total = gets_total(hands, :player)

  if dealer_total > player_total then 'dealer'
  elsif player_total > dealer_total then 'player'
  else 'tie'
  end
end

def display_round_winner(hands)
  round_winner = find_round_winner(hands)
  if round_winner == 'dealer'
    prompt 'Dealer has won!'
  elsif round_winner == 'player'
    prompt 'You have won!'
  else
    prompt "It's a tie!"
  end
end

def play_round
  deck, hands = start_round
  display_starting_hands(hands)

  bust_or_stay = player_turn(deck, hands)
  if bust_or_stay == 'bust'
    bust(hands, :player)
    binding.pry
    display_round_result(hands)
  else
    display_stay_msg(:player)
  end

  bust_or_stay = dealer_turn(deck, hands)
  if bust_or_stay == 'bust'
    bust(hands, :dealer)
    display_round_result(hands)
  else
    display_stay_msg(:dealer)
  end

  display_round_result(hands)
end

play_round
