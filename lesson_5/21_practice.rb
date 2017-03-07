# 21_practice.rb

# 21 is a card game with a dealer and a player
  # goal is to get to as close to 21 as possible without going over
    # dealer and player are both dealt 2 cards from a 52 card deck
      # player can only see one of dealers cards
    # player goes first
      # player can either hit or stay
        # hit: get dealt one card
          # if total value of cards > 21 then player busts
        # stay: dealer's turn
    # dealer does the same, hitting until total value of his cards >= 17
      # player wins if dealer busts
    # if dealer stays, then cards are compared
      # highest total wins
      # if both totals are equal, then tie

# nouns: dealer, player, participant, deck, card, hand, total, game
# verbs: deal, hit, stay, bust, compare

module Interface
  private

  def clear_screen
    system('clear') || system('cls')
  end

  def display_empty_line(num = 1)
    puts "\n" * num
  end

  def display_underscore_line(size = 80)
    puts '_' * size
  end

  def joinor(arr, separator = ', ', word = 'or')
    arr = [*arr[0...-1], "#{word} #{arr.last}"] if arr.size > 1
    arr.size == 2 ? arr.join(' ') : arr.join(separator)
  end

  def pause(seconds)
    sleep(seconds)
  end

  def prompt(msg)
    puts ">> #{msg}"
  end

  def bullet_prompt(msg)
    puts " - #{msg}"
  end
end


class Card
  attr_reader :type, :value

  def initialize(type)
    @type = type
    @value = calc_value
  end

  def calc_value
    return type if type.is_a?(Integer)
    type == 'Ace' ? 11 : 10
  end

  def to_s
    type.to_s
  end

  def high_ace?
    type == 'Ace' && value == 11
  end

  def to_low_ace
    high_ace? && @value = 1
  end
end

class Deck
  CARD_TYPES = [*2..10, 'Jack', 'Queen', 'King', 'Ace'].freeze

  attr_reader :cards

  def initialize
    @cards = (CARD_TYPES * 4).map { |type| Card.new(type) }.shuffle
  end

  def deal
    cards.pop
  end
end

class Hand
  include Comparable
  include Interface

  attr_reader :deck, :cards

  def initialize(deck)
    @deck = deck
    @cards = 2.times.map { deck.deal }
  end

  def calc_sum
    cards.map(&:value).reduce(:+)
  end

  def bust?(sum = total)
    sum > 21
  end

  def total
    loop do
      sum = calc_sum
      return sum unless (bust?(sum) && high_ace_present?)
      lower_ace_value
    end
  end

  def lower_ace_value
    cards.find(&:high_ace?).to_low_ace
  end

  def high_ace_present?
    cards.any?(&:high_ace?)
  end

  def add_card
    cards << deck.deal
  end

  def newest_card
    cards.last
  end

  def display_dealt_card
    bullet_prompt "Card dealt: #{newest_card}"
  end

  def display
    bullet_prompt self
  end

  def display_total
    bullet_prompt "Total hand value: #{total}"
  end

  def <=>(other)
    total <=> other.total
  end

  def to_s
    "Hand: #{cards.join(', ')}"
  end
end

class Participant
  include Interface

  attr_reader :hand

  def initialize(deck)
    @hand = Hand.new(deck)
  end

  def hit
    display_underscore_line(25)
    prompt "#{self.class} hits..."
    hand.add_card
    hand.display_dealt_card

    return if hand.bust?
    hand.display
    hand.display_total
  end
end

class Player < Participant
  def get_choice
    loop do
      prompt 'Would you like to (h)it or (s)tay?'
      choice = gets.strip
      return choice if valid_choice?(choice)
      prompt "'#{choice}' is not a valid choice. Please enter 'h' or 's':"
    end
  end

  def valid_choice?(choice)
    choice =~ /\A(h(it)?|s(tay)?)\z/i
  end

  def display_stay_msg
    prompt "You stay at #{hand.total}."
  end

  def take_turn
    loop do
      choice = get_choice
      if choice =~ /h/
        hit
        if hand.bust?
          prompt "#{self.class} busted at #{hand.total}!"
          break
        end
        puts "\n\n"
      else
        display_stay_msg
        break
      end
    end
  end
end

class Dealer < Participant
  def take_turn
    display_underscore_line(25)
    prompt 'Dealer turn!'
    display_empty_line(2)

    hand.display
    hand.display_total

   loop do
      break if hand.total >= 17
      hit
   end

    if hand.bust?
      display_underscore_line(30)
      prompt "#{self.class} busted at #{hand.total}!"
    end

    hand.display
    hand.display_total
  end
end

class Game
  include Interface

  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new(deck)
    @dealer = Dealer.new(deck)
  end

  def determine_winner
    display_empty_line
    display_underscore_line(50)
    display_empty_line(2)
    if player.hand.bust?
      puts 'Player loses!'
    elsif dealer.hand.bust?
      puts 'Dealer loses!'
    elsif player.hand > dealer.hand
      puts 'Player wins!'
    elsif dealer.hand > player.hand
      puts 'Dealer wins!'
    else
      puts "It's a tie!"
    end
  end

  def play
    # p player.hand.cards
    player.hand.display
    player.hand.display_total
    player.take_turn


    puts "\n\n"
    unless player.hand.bust?
      dealer.take_turn
    end

    determine_winner
  end
end

Game.new.play
