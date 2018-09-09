# A Pythagorean triplet is a set of three natural numbers, {a, b, c}, for which,
# a**2 + b**2 = c**2.

# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.


# option 1 - using Array#combination - shorter but slower:
class Triplet
  def self.where(max_factor:, min_factor: 1, sum: nil)
    triplets = (min_factor..max_factor).to_a.combination(3).map { |nums| new(*nums) }
    triplets.select { |triplet| triplet.pythagorean? && !(sum&.!= triplet.sum) }
  end

  define_method(:initialize)   { |*nums| @nums = nums }
  define_method(:sum)          { @nums.sum }
  define_method(:product)      { @nums.reduce(:*) }
  define_method(:pythagorean?) { @nums.first(2).sum(&:abs2) == @nums.last.abs2 }
end



# Option 2 - using Set and custom combination method - longer but ~4x faster:
require 'set'

class Triplet
  def self.where(max_factor:, min_factor: 1, sum: nil)
    triplets(max_factor, min_factor).reject { |triplet| sum&.!= triplet.sum }
  end

  def self.triplets(max, min)
    min.upto(max - 2).with_object(Set.new) do |a, triplets|
      (a + 1).upto(max - 1) do |b|
        (b + 1).upto(max) do |c|
          break unless a + b > c
          triplet = new(a, b, c)
          triplets << triplet if triplet.pythagorean?
        end
      end
    end
  end

  def initialize(*nums)
    @nums = nums
  end

  def sum
    @nums.sum
  end

  def product
    @nums.reduce(:*)
  end

  def pythagorean?
    @nums.map(&:abs2).tap { |a, b, c| return a + b == c }
  end
end








  # def pythagorean?
  #   @nums.map(&:abs2).tap { |a, b, c| return a + b == c }
  # end