# Write an algorithm to pick the best poker hand(s) from a list.

# See wikipedia for an overview of poker hands. For this exercise, you don't
# have to consider wild cards.

# Focus to get the tests below to pass. We're using 2 letters to represent a
# poker card - the first letter is the rank of the card, represented by 2, 3, 4,
# 5, 6, 7, 8, 9, T, J, Q, K, and A. The second letter is the suit of the card,
# represented by S, H, C and D (Spades, Hearts, Clubs and Diamonds). For
# example, "8D" means eight of diamonds, "TH" means ten of hearts, and "AS"
# means ace of spades.

# rules:
  # straight flush: 5 cards of sequential rank, all same suit
    # ranked by the rank of its highest ranking card
      # ex:  10,9,8,7,6  >  8,7,6,5,4
  # 4 of a kind: 4 cards of same rank
    # ranked first by quadruplet, then by remaining card (kicker)
  # full house: 3 cards same rank, 2 cards same rank
    # ranked first by rank of triplet, then by rank of pair
  # flush: 5 cards same suit, but not all of sequential rank
    # ranked in order of highest ranking card -> lowest
      # ex:   J,10,9,4,2  >  J,10,8,4,3  >  J,10,8,4,2
  # straight: 5 cards of sequential rank, but different suits
    # ranked by highest ranking card
  # 3 of a kind: 3 cards of same rank
    # ranked first by triplet, then rank of highest ranking kicker, then lowest..
      # ex:  6,6,6,Q,4  >  3,3,3,K,2  >  3,3,3,J,7  >  3,3,3,J,5
  # 2 pair: 2 cards of same rank, and 2 cards of another same rank
    # ranked first by highest ranking pair, then lowest, then kicker
  # 1 pair: 2 cards of same rank, 3 cards of 3 other ranks (kickers)
    # ranked first by rank of pair, then by rank of kickers, from highest to lowest
      # ex:  6,6,Q,8,7  >  6,6,Q,8,3
  # high card: none of the above
    # ranked by highest ranking card to lowest
      # ex:  Q,10,7,5,4  >  Q,10,7,5,2
  # hands with same rank that only differ by suit are equal
    # so return both in best_hand array
# algorithm:
  # map each hand to a score
    # save score and ranks to an array
    # if scores are the same, then examine specific cards and rank them
    # return highest ranking hand(s) as a nested array
# 9)  straight flush:  5 groups:  straight && flush
# 8)  4 of a kind:     2 groups:  4 same rank
# 7)  full house:      2 groups:  3 same rank, 2 same rank
# 6)  flush:           5 groups:  any ranks, ALL SAME SUIT
# 5)  straight:        5 groups:  sequential ranks.  ex: [A,2,3,4,5]
# 4)  3 of a kind:     3 groups:  3 same rank, 1,1 other ranks
# 3)  2 pair:          3 groups:  2 same rank, 2 same rank, 1 other rank
# 2)  1 pair:          4 groups:  2 same rank, 1,1,1 other ranks
# 1)  high card:       5 groups:  all different ranks
# for same hands:  sort first by group size, then by rank, in descending order







Poker = Struct.new(:hand_cards) do
  def best_hand
    hands = hand_cards.map { |cards| Hand.new(cards) }
    hands.select { |hand| hand == hands.max }.map(&:cards)
  end
end

Hand = Struct.new(:cards, :suits, :values, :groups, :score) do
  include Comparable

  RANK_VALUES = %w[0 1 2 3 4 5 6 7 8 9 T J Q K A].freeze
  SCORE_METHODS = %i[one_pair? two_pair? three_of_a_kind? straight? flush?
                     full_house? four_of_a_kind? straight_flush?].freeze

  def initialize(cards)
    self.cards = cards
    ranks, self.suits = cards.map(&:chars).transpose
    self.values = ranks.map { |rank| RANK_VALUES.index(rank) }.sort
    self.groups = values.chunk_while { |a, b| a == b }.sort_by(&:size).reverse
    self.score = SCORE_METHODS.rindex { |m| method(m).call } || -1
  end

  def <=>(other)
    [score, groups] <=> [other.score, other.groups]
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    groups.first.size == 4
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def flush?
    self.suits.uniq.size == 1
  end

  def straight?
    self.values = *1..5 if values == [2, 3, 4, 5, 14]
    values == [*Range.new(*values.minmax)]
  end

  def three_of_a_kind?
    groups.first.size == 3
  end

  def two_pair?
    groups.map(&:size) == [2, 2, 1]
  end

  def one_pair?
    groups.one? { |group| group.size == 2 }
  end
end

#     high_of_jack = %w(4S 5S 7H 8D JC)
#     game = Poker.new([high_of_jack])
#     p game.best_hand

# puts
#         high_of_8 = %w(4S 5H 6S 8D 2H)
#     high_of_queen = %w(2S 4H 6S TD QH)
#     game = Poker.new([high_of_8, high_of_queen])
#     p game.best_hand
#     puts

#         straight_to_8 = %w(4S 6H 7S 8D 5H)
#     straight_to_9 = %w(5S 7H 8S 9D 6H)
#     game = Poker.new([straight_to_8, straight_to_9])
#    p game.best_hand
#    puts

#        straight_flush_to_8 = %w(4H 6H 7H 8H 5H)
#     straight_flush_to_9 = %w(5S 7S 8S 9S 6S)
#     game = Poker.new([straight_flush_to_8, straight_flush_to_9])
#     p game.best_hand
#     puts

#     double_pair_2_and_8 = %w(2S 8H 2S 8D JH)
#     three_of_4 = %w(4S 5H 4S 8D 4H)
#     game = Poker.new([double_pair_2_and_8, three_of_4])
# p game.best_hand
