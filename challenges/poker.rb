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







class Poker
  def initialize(hands)
    @hands = hands.map { |cards| Hand.new(cards) }
  end

  def best_hand
    max_hand = @hands.max
    @hands.select { |hand| hand == max_hand }.map(&:cards)
  end
end

class Hand
  include Comparable

  RANK_VALUES = %w[0 1 2 3 4 5 6 7 8 9 T J Q K A]

  attr_reader :cards, :values

  def initialize(cards)
    @cards = cards
    @ranks, @suits = cards.map(&:chars).transpose
    @values = @ranks.map { |rank| RANK_VALUES.index(rank) }.sort
  end

  def <=>(other)
    result = score <=> other.score
    return result unless result.zero?
    case score
    when 9, 5
      values.max <=> other.values.max
    when 8
      [quadruplet, kickers] <=> [other.quadruplet, other.kickers]
    when 7
      [triplet, pairs] <=> [other.triplet, other.pairs]
    when 6, 1
      values.reverse <=> other.values.reverse
    when 4
      [triplet, kickers] <=> [other.triplet, other.kickers]
    when 3, 2
      [pairs, kickers] <=> [other.pairs, other.kickers]
    end
  end

  def quadruplet
    ns_of_a_kind(4)
  end

  def triplet
    ns_of_a_kind(3)
  end

  def pairs
    ns_of_a_kind(2)
  end

  def kickers
    ns_of_a_kind(1)
  end

  def ns_of_a_kind(n)
    values.uniq.select { |value| values.count(value) == n }.sort.reverse
  end

  def score
    case
    when straight_flush?  then 9
    when four_of_a_kind?  then 8
    when full_house?      then 7
    when flush?           then 6
    when straight?        then 5
    when three_of_a_kind? then 4
    when two_pair?        then 3
    when one_pair?        then 2
    else                       1
    end
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def flush?
    @suits.uniq.size == 1
  end

  def straight?
    low_ace_values = values.map { |value| value == 14 ? 1 : value }.sort
    [values, low_ace_values].any? { |vals| vals == (vals.min..vals.max).to_a }
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    @values.uniq.count { |value| @values.count(value) == 2 } == 2
  end

  def one_pair?
    n_of_a_kind?(2)
  end

  def n_of_a_kind?(n)
    @values.uniq.any? { |value| @values.count(value) == n }
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
