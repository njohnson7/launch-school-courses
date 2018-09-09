require 'minitest/autorun'
require_relative 'odd_words'

class OddWordsTest < Minitest::Test
  def test_one_word
    sentence = OddWords.new("hi.").reverse_odds
    assert_equal("hi.", sentence)
  end

  def test_two_words
    sentence = OddWords.new("hi jim.").reverse_odds
    assert_equal("hi mij.", sentence)
  end

  def test_3_word_sentence
    sentence = OddWords.new("hi jim bye.").reverse_odds
    assert_equal("hi mij bye.", sentence)
  end

  def test_4_word_sentence_with_period
    sentence = OddWords.new("hi jim bye bill.").reverse_odds
    assert_equal("hi mij bye llib.", sentence)
  end

  def test_4_word_sentence_with_period
    sentence = OddWords.new("hi     jim bye bill      .").reverse_odds
    assert_equal("hi mij bye llib.", sentence)
  end

  def test_raises_error_when_no_ending_dot
    assert_raises(ArgumentError) do
      OddWords.new('hello sir').reverse_odds
      OddWords.new('hello sir. ').reverse_odds
    end
  end

  def test_raises_error_when_other_characters_present
    assert_raises(ArgumentError) do
      OddWords.new('hello!.').reverse_odds
    end
  end

  def test_raises_error_when_any_word_longer_than_20_chars
    assert_raises(ArgumentError) do
      OddWords.new('helloworldhowareyoudoing sir.').reverse_odds
    end
  end

  def test_raises_error_when_empty_string
    assert_raises(ArgumentError) do
      OddWords.new('').reverse_odds
    end
  end

  def test_does_not_mutate_string
    string = 'hello world.'
    sentence = OddWords.new(string).reverse_odds
    assert_equal('hello world.', string)
  end
end
