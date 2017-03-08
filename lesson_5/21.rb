# frozen_string_literal: true

# 21.rb

module Interface
  QUARTER_WIDTH = 30
  HALF_WIDTH = 55
  FULL_WIDTH = 80

  private

  def bullet_prompt(msg)
    puts "  - #{msg}"
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_break_line(width = FULL_WIDTH, char = '_')
    puts char * width
  end

  def display_empty_line(num = 1)
    puts "\n" * num
  end

  def display_heading(msg, width = HALF_WIDTH, char = '-')
    puts " #{msg} ".center(width, char)
  end

  def join_and(arr, separator = ', ', word = 'and')
    arr = [*arr[0...-1], "#{word} #{arr.last}"] if arr.size > 1
    arr.size == 2 ? arr.join(' ') : arr.join(separator)
  end

  def pause(seconds)
    sleep(seconds)
  end

  def prompt(msg)
    puts ">> #{msg}"
  end
end

class Card
  HIGH_ACE_VALUE = 11
  LOW_ACE_VALUE = 1
  FACE_CARD_VALUE = 10
  TYPES = [*2..10, 'Jack', 'Queen', 'King', 'Ace'].freeze
  UNKNOWN_TYPE = '?'

  attr_reader :value

  def initialize(type)
    @type = type
    @value = calc_value
  end

  def to_s
    type.to_s
  end

  def high_ace?
    ace? && value == HIGH_ACE_VALUE
  end

  def to_low_ace
    high_ace? && @value = LOW_ACE_VALUE
  end

  private

  attr_reader :type

  def ace?
    type == 'Ace'
  end

  def calc_value
    return type if type.is_a?(Integer)
    ace? ? HIGH_ACE_VALUE : FACE_CARD_VALUE
  end
end

class Deck
  def initialize
    reset
  end

  def deal_one
    cards.pop
  end

  def reset
    @cards = (Card::TYPES * 4).map { |type| Card.new(type) }.shuffle
  end

  private

  attr_reader :cards
end

class Hand
  include Comparable
  include Interface

  MAX_TOTAL = 21

  def initialize(deck)
    @deck = deck
    reset
  end

  def <=>(other)
    total <=> other.total
  end

  def add_card
    cards << deck.deal_one
  end

  def bust?(current_total = total)
    current_total > MAX_TOTAL
  end

  def display
    bullet_prompt "Hand:   #{self}"
  end

  def display_total
    bullet_prompt "Total:  #{total}"
  end

  def first_card_value
    "#{cards.first.value} + #{Card::UNKNOWN_TYPE}"
  end

  def hide_last_card
    to_s.gsub(/(?<=and ).+\z/, Card::UNKNOWN_TYPE)
  end

  def reset
    @cards = Array.new(2) { deck.deal_one }
  end

  def total
    account_for_aces
    calc_total
  end

  def to_s
    join_and(cards)
  end

  private

  attr_reader :deck, :cards

  def account_for_aces
    lower_ace_value while bust?(calc_total) && high_ace_present?
  end

  def calc_total
    cards.map(&:value).reduce(:+)
  end

  def high_ace_present?
    cards.any?(&:high_ace?)
  end

  def lower_ace_value
    cards.find(&:high_ace?).to_low_ace
  end
end

class Participant
  include Interface

  attr_reader :hand, :name

  def initialize(deck)
    @hand = Hand.new(deck)
    set_name
  end

  def busted?
    hand.bust?
  end

  private

  def display_hand_and_total
    hand.display
    hand.display_total
  end

  def display_hit_msg
    display_break_line(QUARTER_WIDTH)
    prompt "#{name} hits..."
    display_empty_line
  end

  def display_stay_msg
    display_empty_line
    prompt "#{name} stays at #{hand.total}..."
  end

  def hit
    display_hit_msg
    pause(1)
    hand.add_card
    display_hand_and_total
  end
end

class Player < Participant
  def name
    @name.gsub(/\b\w/, &:upcase)
  end

  def take_turn
    loop do
      choice = make_choice
      break display_stay_msg if choice.start_with?('s')
      hit
      break if busted?
    end
    pause(1)
  end

  private

  def make_choice
    display_empty_line
    loop do
      prompt 'Would you like to (h)it or (s)tay?'
      choice = gets.strip
      return choice if valid_choice?(choice)
      prompt "'#{choice}' is not a valid choice. Please enter 'h' or 's':"
    end
  end

  def set_name
    loop do
      prompt 'Please enter your name:'
      chosen_name = gets.strip
      break @name = chosen_name unless chosen_name.empty?
      prompt 'Sorry, name cannot be empty.'
    end
  end

  def valid_choice?(choice)
    choice =~ /\A(h(it)?|s(tay)?)\z/i
  end
end

class Dealer < Participant
  NAMES = %w[R2-D2 C-3PO 4-LOM HK-47].freeze
  STAY_TOTAL = 17

  def take_turn
    display_start_turn
    hit until hand.total >= STAY_TOTAL
    display_stay_msg unless busted?
    pause(1)
  end

  private

  def display_start_turn
    display_empty_line
    display_break_line(HALF_WIDTH)
    prompt "#{name}'s turn!"
    display_empty_line
    display_hand_and_total
  end

  def set_name
    @name = NAMES.sample
  end
end

class TwentyOne
  include Interface

  TITLE = 'Twenty-One'

  def initialize
    display_welcome_msg
    @deck = Deck.new
    @player = Player.new(deck)
    @dealer = Dealer.new(deck)
  end

  def play
    loop do
      clear_screen
      display_starting_hands
      player.take_turn
      dealer.take_turn unless player.busted?
      display_result

      break unless play_again?
      reset
    end

    display_goodbye_msg
  end

  private

  attr_reader :player, :dealer, :deck

  def bust_msg
    loser, winner = [player, dealer].partition(&:busted?).map(&:first)
    "#{loser.name} busts, so #{winner.name} wins!"
  end

  def display_final_hands
    display_empty_line
    prompt 'Final hands:'
    [player, dealer].each { |participant| display_hand(participant) }
  end

  def display_goodbye_msg
    clear_screen
    display_break_line
    puts "Thank you for playing #{TITLE}! Goodbye!".center(FULL_WIDTH)
    display_break_line
  end

  def display_hand(participant, hand = participant.hand,
                   total = participant.hand.total)
    name_str = "#{participant.name}'s hand:".ljust(name_ljust_amount)
    hand_str = hand.to_s
    total_str = "Total: #{total}".rjust(HALF_WIDTH - hand_str.size)

    bullet_prompt "#{name_str}#{hand_str}#{total_str}"
  end

  def display_result
    display_empty_line
    display_break_line(HALF_WIDTH, '=')
    display_empty_line(2)
    display_heading(result_msg)
    display_final_hands
  end

  def display_starting_hands
    prompt 'Starting hands:'
    display_hand(player)
    display_hand(dealer, dealer.hand.hide_last_card,
                 dealer.hand.first_card_value)
  end

  def display_welcome_msg
    clear_screen
    display_break_line
    puts "Welcome to #{TITLE}!".center(FULL_WIDTH)
    display_break_line
    display_empty_line(3)
  end

  def name_ljust_amount
    [player.name.size, dealer.name.size].max + 10
  end

  def play_again?
    again_msg = ">> Enter any key to play again or 'q' to quit: "
    display_empty_line(2)
    display_break_line(again_msg.size - 1, '-')
    print again_msg
    choice = gets.strip
    !choice.casecmp('q').zero?
  end

  def reset
    deck.reset
    [player.hand, dealer.hand].each(&:reset)
  end

  def result_msg
    if someone_busted? then bust_msg
    elsif tie?         then tie_msg
    else                    win_msg
    end
  end

  def someone_busted?
    [player, dealer].any?(&:busted?)
  end

  def tie?
    dealer.hand == player.hand
  end

  def tie_msg
    "Total hand values are the same, so it's a tie!"
  end

  def win_msg
    winner = [player, dealer].max_by(&:hand)
    "#{winner.name}'s hand is worth more, so #{winner.name} wins!"
  end
end

TwentyOne.new.play
