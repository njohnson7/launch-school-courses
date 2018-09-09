require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)
    other.is_a?(Car) && name == other.name
  end
end

class CarTest < Minitest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new
    car3 = Car.new
    car1.name = 'Civic'
    car2.name = 'Civic'
    car3.name = 'RSX'

    assert_equal(car1, car2)
    # assert_equal(car1, car3)
    # assert_same(car1, car2)
    assert_same(car1, car1)
  end
end