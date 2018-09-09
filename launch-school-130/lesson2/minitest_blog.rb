require 'minitest/autorun'

def square_root(num)
  return nil if num.negative?
  Math.sqrt(num).round
end

class SquareRootTest < Minitest::Test
  def test_that_square_root_of_9_is_3
    result = square_root 9
    assert_equal 3, result
  end

  def test_that_square_root_of_17_is_4
    result = square_root 17
    assert_equal 4, result
  end

  def test_that_square_root_of_24_is_5
    result = square_root 24
    assert_equal 5, result
  end

  def test_that_square_root_of_negative_number_is_nil
    result = square_root -1
    assert_nil result
  end
end

# assert_in_delta 3.1415, Math::PI, 0.0001   # => pass
# assert_in_delta 3.1415, Math::PI, 0.00001  # => fail
# b/c expected val differs from actual val by
#  more than the 'delta' value, the 3rd arg

