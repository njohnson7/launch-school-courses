require 'prime'

ERROR_MESSAGE = <<-MSG.freeze
Using Ruby's Prime class is probably the best way to do this in a
'real' application; but this is an exercise, not a real application,
so you're expected to implement this yourself.
MSG

# This code prevents you from using any of the prohibited methods.

class Prime
  [:each, :new, :prime?, :take].each do |m|
    define_method(m) { |*_| fail ERROR_MESSAGE }
  end
end

class Integer
  [:prime?, :each_prime].each do |m|
    define_method(m) { |*_| fail ERROR_MESSAGE }
  end
end

# Actual test suite begins here.

require 'minitest/autorun'
require_relative 'nth_prime'

class TestPrimes < Minitest::Test
  def test_first
    assert_equal 2, Prime.nth(1)
  end

  def test_second
    assert_equal 3, Prime.nth(2)
  end

  def test_sixth_prime
    assert_equal 13, Prime.nth(6)
  end

  def test_big_prime
    assert_equal 104_743, Prime.nth(10_001)
  end

  def test_really_big_prime
    assert_equal 1_299_709, Prime.nth(100_000)     # ~1.5 seconds
    # assert_equal 2_750_159, Prime.nth(200_000)     # ~4.5 seconds
    # assert_equal 4_256_233, Prime.nth(300_000)     # ~7.5 seconds
    # assert_equal 15_485_863, Prime.nth(1_000_000)  # ~41 seconds
  end


  def test_weird_case
    assert_raises ArgumentError do
      Prime.nth(0)
    end
  end
end
