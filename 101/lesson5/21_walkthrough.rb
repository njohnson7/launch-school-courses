# 21_walkthrough.rb
# frozen_string_literal: true

SUITS = %w(H D S C).freeze
VALUES = ('2'..'10').to_a + %w(J Q K A).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map(&:last)

  sum = 0
  values.each do |value|
    sum += if value == 'A' then 11
           elsif value.to_i == 0 then 10
           else value.to_i
           end
  end

  # correct for Aces
  values.select { |value| value == 'A' }.count.times { sum -= 10 if sum > 21 }

  sum
end

def busted?(cards)
  total(cards) > 21
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21 then :player_busted
  elsif dealer_total > 21 then :dealer_busted
  elsif dealer_total < player_total then :player
  elsif dealer_total > player_total then :dealer
  else :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted then prompt 'You busted! Dealer wins!'
  when :dealer_busted then prompt 'Dealer busted! You win!'
  when :player then prompt 'You win!'
  when :dealer then prompt 'Dealer wins!'
  when :tie then prompt "It's a tie!"
  end
end

def play_again?
  puts '-------------'
  prompt 'Do you want to play again? (y or n)'
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  prompt 'Welcome to Twenty-One!'

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "Dealer has:  #{dealer_cards.first} and ?"
  prompt "You have:    #{player_cards.first} and #{player_cards.last}}, for a" \
         " total of #{total(player_cards)}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt 'Would you like to (h)it or (s)tay?'
      player_turn = gets.chomp.downcase
      break if %w(h s).include?(player_turn)
      prompt "Sorry, you must enter: 'h' or 's'"
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
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  # dealer turn
  prompt 'Dealer turn...'

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= 17

    prompt 'Dealer hits!'
    dealer_cards << deck.pop
    prompt "Dealer's cards are now #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now #{total(dealer_cards)}"
    display_result(dealer_car ds, player_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  # both player and dealer stays -- compare cards!
  puts '=============='
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts '=============='

  display_result(dealer_cards, player_cards)

  break unless play_again?
end

prompt 'Thank you for playing Twenty-One! Goodbye!'
