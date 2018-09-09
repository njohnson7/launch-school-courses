require 'minitest/autorun'
require_relative 'poker'

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

class PokerTest < Minitest::Test
  def test_one_hand
    high_of_jack = %w(4S 5S 7H 8D JC)
    game = Poker.new([high_of_jack])
    assert_equal [high_of_jack], game.best_hand
  end

  def test_highest_card
    high_of_8 = %w(4S 5H 6S 8D 2H)
    high_of_queen = %w(2S 4H 6S TD QH)
    game = Poker.new([high_of_8, high_of_queen])
    assert_equal [high_of_queen], game.best_hand
  end

  def test_nothing_vs_one_pair
    high_of_king = %w(4S 5H 6S 8D KH)
    pair_of_4 = %w(2S 4H 6S 4D JH)
    game = Poker.new([high_of_king, pair_of_4])
    assert_equal [pair_of_4], game.best_hand
  end

  def test_two_pair
    pair_of_2 = %w(4S 2H 6S 2D JH)
    pair_of_4 = %w(2S 4H 6S 4D JH)
    game = Poker.new([pair_of_2, pair_of_4])
    assert_equal [pair_of_4], game.best_hand
  end

  def test_one_pair_vs_double_pair
    pair_of_8 = %w(2S 8H 6S 8D JH)
    double_pair = %w(4S 5H 4S 8D 5H)
    game = Poker.new([pair_of_8, double_pair])
    assert_equal [double_pair], game.best_hand
  end

  def test_two_double_pair
    double_pair_2_and_8 = %w(2S 8H 2S 8D JH)
    double_pair_4_and_5 = %w(4S 5H 4S 8D 5H)
    game = Poker.new([double_pair_2_and_8, double_pair_4_and_5])
    assert_equal [double_pair_2_and_8], game.best_hand
  end

  def test_double_pair_vs_three
    double_pair_2_and_8 = %w(2S 8H 2S 8D JH)
    three_of_4 = %w(4S 5H 4S 8D 4H)
    game = Poker.new([double_pair_2_and_8, three_of_4])
    assert_equal [three_of_4], game.best_hand
  end

  def test_two_three
    three_of_2 = %w(2S 2H 2S 8D JH)
    three_of_1 = %w(4S AH AS 8D AH)
    game = Poker.new([three_of_2, three_of_1])
    assert_equal [three_of_1], game.best_hand
  end

  def test_three_vs_straight
    three_of_4 = %w(4S 5H 4S 8D 4H)
    straight = %w(3S 4H 2S 6D 5H)
    game = Poker.new([three_of_4, straight])
    assert_equal [straight], game.best_hand
  end

  def test_an_ace_low_straight
    three_of_4 = %w(4S 5H 4S 8D 4H)
    straight_to_5 = %w(4S AH 3S 2D 5H)
    game = Poker.new([three_of_4, straight_to_5])
    assert_equal [straight_to_5], game.best_hand
  end

  def test_two_straights
    straight_to_8 = %w(4S 6H 7S 8D 5H)
    straight_to_9 = %w(5S 7H 8S 9D 6H)
    game = Poker.new([straight_to_8, straight_to_9])
    assert_equal [straight_to_9], game.best_hand
  end

  def test_straight_vs_flush
    straight_to_8 = %w(4S 6H 7S 8D 5H)
    flush_to_7 = %w(2S 4S 5S 6S 7S)
    game = Poker.new([straight_to_8, flush_to_7])
    assert_equal [flush_to_7], game.best_hand
  end

  def test_two_flushes
    flush_to_8 = %w(3H 6H 7H 8H 5H)
    flush_to_7 = %w(2S 4S 5S 6S 7S)
    game = Poker.new([flush_to_8, flush_to_7])
    assert_equal [flush_to_8], game.best_hand
  end

  def test_flush_vs_full
    flush_to_8 = %w(3H 6H 7H 8H 5H)
    full = %w(4S 5H 4S 5D 4H)
    game = Poker.new([flush_to_8, full])
    assert_equal [full], game.best_hand
  end

  def test_two_fulls
    full_of_4_by_9 = %w(4H 4S 4D 9S 9D)
    full_of_5_by_8 = %w(5H 5S 5D 8S 8D)
    game = Poker.new([full_of_4_by_9, full_of_5_by_8])
    assert_equal [full_of_5_by_8], game.best_hand
  end

  def test_full_vs_square
    full = %w(4S 5H 4S 5D 4H)
    square_of_3 = %w(3S 3H 2S 3D 3H)
    game = Poker.new([square_of_3, full])
    assert_equal [square_of_3], game.best_hand
  end

  def test_two_square
    square_of_2 = %w(2S 2H 2S 8D 2H)
    square_of_5 = %w(4S 5H 5S 5D 5H)
    game = Poker.new([square_of_2, square_of_5])
    assert_equal [square_of_5], game.best_hand
  end

  def test_square_vs_straight_flush
    square_of_5 = %w(4S 5H 5S 5D 5H)
    straight_flush_to_9 = %w(5S 7S 8S 9S 6S)
    game = Poker.new([square_of_5, straight_flush_to_9])
    assert_equal [straight_flush_to_9], game.best_hand
  end

  def test_two_straight_flushes
    straight_flush_to_8 = %w(4H 6H 7H 8H 5H)
    straight_flush_to_9 = %w(5S 7S 8S 9S 6S)
    game = Poker.new([straight_flush_to_8, straight_flush_to_9])
    assert_equal [straight_flush_to_9], game.best_hand
  end

  def test_three_hand_with_tie
    spade_straight_to_9 = %w(9S 8S 7S 6S 5S)
    diamond_straight_to_9 = %w(9D 8D 7D 6D 5D)
    three_of_4 = %w(4D 4S 4H QS KS)
    hands = [spade_straight_to_9, diamond_straight_to_9, three_of_4]
    game = Poker.new(hands)
    assert_equal [spade_straight_to_9, diamond_straight_to_9], game.best_hand
  end
end
