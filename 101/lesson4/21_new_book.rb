# 21_new_book.rb
# frozen_string_literal: true

CARDS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze
MAX_POINTS = 27
DEALER_STAYS_POINTS = 23
ROUND_POINTS = 2
CENTER_WIDTH = 80
WELCOME_MSG = "Welcome to #{MAX_POINTS}!".center(CENTER_WIDTH).freeze
SEPARATOR_LINE = ''.center(CENTER_WIDTH, '_').freeze
SEPARATOR_LINE_2 = ''.center(CENTER_WIDTH, '=').freeze
GOODBYE_MSG =
  "Thank you for playing #{MAX_POINTS}! Goodbye!".center(CENTER_WIDTH) .freeze
PLAY_AGAIN_MSG = "Do you want to play again? ('y' or 'n')".freeze
PLAY_AGAIN_MSG_WIDTH = PLAY_AGAIN_MSG.size + 3

def prompt(msg)
  puts ">> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def pause
  sleep(1)
end

def display_greeting(msg)
  clear_screen
  puts SEPARATOR_LINE
  puts msg
  puts SEPARATOR_LINE
  puts
  puts "\n\n" if msg == WELCOME_MSG
end

def join(arr)
  return arr.to_s if arr.size <= 1
  "#{arr[0...-1].join(', ')} and #{arr[-1]}"
end

def initialize_deck
  (CARDS * 4).shuffle
end

def deal_starting_cards(deck)
  [deck.pop(2), deck.pop(2)]
end

def display_starting_cards(dealer_cards, player_cards)
  puts "Round start!".center(CENTER_WIDTH)
  puts SEPARATOR_LINE_2
  prompt "Dealer has:  #{dealer_cards.first} and Unknown Card"
  prompt "You have:    #{join(player_cards)}   (Total: #{total(player_cards)})"
end

def display_ending_cards(dealer_cards, player_cards)
  puts SEPARATOR_LINE_2
  prompt "Dealer has:  #{join(dealer_cards)}, for a total of: #{total(dealer_cards)}"
  prompt "You have:    #{join(player_cards)}, for a total of: #{total(player_cards)}"
  puts "#{SEPARATOR_LINE_2}\n\n"
end

def display_current_cards(cards, person, current_total)
  person_str = person == :player ? 'Your' : "Dealer's"
  prompt "#{person_str} cards are now:  #{join(cards)}"
  prompt "#{person_str} total is now:   #{current_total}\n\n"
end

def player_turn(deck, dealer_cards, player_cards)
  loop do
    hit_stay = hit_or_stay
    if hit_stay == 'h'
      player_cards << deck.pop
      prompt 'You chose to hit!'
    end
    current_total = total(player_cards)
    display_current_cards(player_cards, :player, current_total) if hit_stay == 'h'
    if hit_stay == 's' || busted?(player_cards)
      break bust_stay(dealer_cards, player_cards, :player, current_total)
    end
  end
end

def dealer_turn(deck, dealer_cards, player_cards)
  prompt "Dealer's turn......\n\n"
  loop do
    current_total = total(dealer_cards)
    display_current_cards(dealer_cards, :dealer, current_total)
    if busted?(dealer_cards) || current_total >= DEALER_STAYS_POINTS
      break bust_stay(dealer_cards, player_cards, :dealer, current_total)
    end
    prompt 'Dealer hits!'
    prompt 'Dealing card...'
    pause
    dealer_cards << deck.pop
  end
end

def total(cards)
  sum = cards.reduce(0) do |s, card|
    s + case card
        when '0'..'10' then card.to_i
        when 'Ace'     then 11
        else                10
        end
  end
  cards.count('Ace').times { sum -= 10 if sum > MAX_POINTS }
  sum
end

def hit_or_stay
  loop do
    prompt  "Would you like to (h)it or (s)tay?"
    choice = gets.chomp
    return choice[0].downcase if choice =~ /\Ah(it)?|s(tay)?\z/i
    prompt "Invald choice. Please enter 'h' or 's'"
  end
end

def busted?(cards)
  total(cards) > MAX_POINTS
end

def bust_stay(dealer_cards, player_cards, person, current_total)
  if person == :player
    cards = player_cards
    person_str = 'You stayed'
  else
    cards = dealer_cards
    person_str = 'Dealer stays'
  end
  if busted?(cards)
    display_result(dealer_cards, player_cards)
    return (play_again? ? :again : :quit)
  else
    prompt "#{person_str} at #{current_total}\n\n\n"
    :stay
  end
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)
  if player_total > MAX_POINTS              then :player_busted
  elsif dealer_total > MAX_POINTS           then :dealer_busted
  elsif dealer_total < player_total         then :player
  elsif dealer_total > player_total         then :dealer
  else                                           :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)
  case result
  when :player_busted then prompt 'You busted! Dealer wins!'
  when :dealer_busted then prompt 'Dealer busted! You win!'
  when :player        then prompt 'You win!'
  when :dealer        then prompt 'Dealer wins!'
  when :tie           then prompt "It's a tie!"
  end
  puts "\n"
end

def play_again?
  puts ''.ljust(PLAY_AGAIN_MSG_WIDTH, '-')
  prompt PLAY_AGAIN_MSG
  answer = gets.chomp
  clear_screen
  !!answer[/\Ay[aehs]*\z/i]
end

def play_game
  loop do
    deck = initialize_deck
    player_cards, dealer_cards = deal_starting_cards(deck)
    display_starting_cards(dealer_cards, player_cards)

    case player_turn(deck, dealer_cards, player_cards)
    when :again then next
    when :quit  then break
    end

    case dealer_turn(deck, dealer_cards, player_cards)
    when :again then next
    when :quit  then break
    end

    display_ending_cards(dealer_cards, player_cards)
    display_result(dealer_cards, player_cards)

    break unless play_again?
  end
end

display_greeting(WELCOME_MSG)
play_game
display_greeting(GOODBYE_MSG)
