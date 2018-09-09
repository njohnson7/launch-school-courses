# 21_new.rb


def prompt(str)
  puts ">> #{str}"
end

def display_welcome_msg
  puts 'Welcome to 21!'.center(80, '_')
  puts "\n\n\n\n"
end

def display_goodbye_msg
  puts "\n\n\n\n"
  puts 'Thank you for playing 21! Goodbye!'.center(80, '-')
end

def display_starting_hands(hands)
  prompt "Dealer has:  #{hands[:dealer].first} and unknown card"
  display_player_hand(hands)
  puts
end

def display_player_hand(hands)
  prompt "You have:    #{join_and(hands[:player])}  " \
         "(Value: #{sum_hand(hands, :player)})"
end

def display_dealer_hand(hands)
  prompt "Dealer has:  #{join_and(hands[:dealer])}  " \
         "(Value: #{sum_hand(hands, :dealer)})"
end

def join_and(arr)
  return arr.to_s if arr.size <= 1
  "#{arr[0...-1].join(', ')} and #{arr[-1]}"
end

def initialize_deck
  (%w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace] * 4).shuffle
end

def deal_starting_hands(deck)
  { player: deck.pop(2), dealer: deck.pop(2) }
end

def player_turn(deck, hands)
  prompt 'You get to go first!'
  loop do
    break if game_over?(hands, :player)
    choice = hit_stay
    if choice == 'h'
      player_hits(deck, hands)
      display_player_hand(hands)
    else
      break prompt 'You have chosen to stay.'
    end
  end
end

def hit_stay
  loop do
    prompt  "Enter 'h' to hit or 's' to stay:"
    choice = gets.chomp
    return choice[0].downcase if choice =~ /\Ah(it)?|s(tay)?\z/i
    prompt "Invald choice."
  end
end

def player_hits(deck, hands)
  prompt "You have chosen to hit!"
  hands[:player] << deck.pop
end

def dealer_turn(deck, hands)
  puts "\n\n\n"
  prompt "Dealer's turn!"
  loop do
    sum = sum_hand(hands, :dealer)
    display_dealer_hand(hands)
    if sum.between?(17, 20)
      break prompt 'Dealer has chosen to stay.'
    elsif game_over?(hands, :dealer)
      break
    end
    dealer_hits(deck, hands)
  end
end

def dealer_hits(deck, hands)
  prompt 'Dealer has chosen to hit!'
  hands[:dealer] << deck.pop
end

def sum_hand(hands, person)
  hand = hands[person]
  values = card_values(hand)
  sum = values.reduce(:+)
  sum = adjust_for_aces(values, sum)
end

def card_values(hand)
  hand.map do |card|
    case card
    when '2'..'10' then card.to_i
    when 'Ace'     then 11
    else                10
    end
  end.sort
end

def adjust_for_aces(values, sum)
  while sum > 21 && values.include?(11)
    sum -= 10
    values.pop
  end
  sum
end

def bust?(hands, person)
  sum_hand(hands, person) > 21
end

def twenty_one?(hands, person)
  sum_hand(hands, person) == 21
end

def game_over?(hands, person)
  bust?(hands, person) || twenty_one?(hands, person)
end

def dealer_wins
  prompt 'Dealer wins!'
end

def player_wins
  prompt 'You win!'
end

def dealer_busts
  prompt 'Dealer has busted!'
  player_wins
end

def player_busts
  prompt 'You have busted!'
  dealer_wins
end

def dealer_21
  prompt 'Dealer has 21!'
  dealer_wins
end

def player_21
  prompt 'You have 21!'
  player_wins
end

def tie
  prompt "It's a tie!"
end

def compare_hands(hands)
  display_player_hand(hands)
  display_dealer_hand(hands)
  player_sum = sum_hand(hands, :player)
  dealer_sum = sum_hand(hands, :dealer)
  if dealer_sum > player_sum
    prompt "Dealer's hand is a higher value."
    dealer_wins
  elsif player_sum > dealer_sum
    prompt "Your hand is a higher value."
    player_wins
  else
    prompt 'You and dealer both have the same value.'
    tie
  end
end

def results(hands)
  puts "\n\n\n\n"
  puts "ROUND OVER".center(60, '-')
  if bust?(hands, :player)
    player_busts
  elsif twenty_one?(hands, :player)
    player_21
  elsif bust?(hands, :dealer)
    dealer_busts
  elsif twenty_one?(hands, :dealer)
    dealer_21
  else
    compare_hands(hands)
  end
end

def play_round
  deck = initialize_deck
  hands = deal_starting_hands(deck)
  display_starting_hands(hands)
  player_turn(deck, hands)
  dealer_turn(deck, hands) unless game_over?(hands, :player)
  results(hands)
end

def play_game
  display_welcome_msg
  play_round
  display_goodbye_msg
end

play_game
