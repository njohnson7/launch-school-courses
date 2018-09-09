# medium1_09.rb

class Card
  include Comparable

  FACE_CARDS = %w[Jack Queen King Ace].freeze

  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = rank_to_value
  end

  def <=>(other)
    value <=> other.value
  end

  def to_s
    "#{rank} of #{suit}"
  end

  private

  def rank_to_value
    rank.is_a?(Integer) ? rank : FACE_CARDS.index(rank) + 11
  end
end

class Deck
  RANKS = [*2..10, *%w[Jack Queen King Ace]].freeze
  SUITS = %w[Hearts Clubs Diamonds Spades].freeze

  attr_reader :cards

  def initialize
    set_cards
  end

  def draw
    set_cards if cards.empty?
    cards.pop
  end

  private

  def set_cards
    @cards = RANKS.product(SUITS).map { |rank, suit| Card.new(rank, suit) }.shuffle
  end
end


deck = Deck.new
# puts deck.cards
drawn = []
p 52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
p 52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.



# (8*10**68).times do
#   drawn = []
#   52.times { drawn << deck.draw }
#   drawn.count { |card| card.rank == 5 } == 4
#   drawn.count { |card| card.suit == 'Hearts' } == 13

#   drawn2 = []
#   52.times { drawn2 << deck.draw }
#   same = drawn == drawn2 # Almost always.
#   p same if same
# end
