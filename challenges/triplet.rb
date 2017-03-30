# A Pythagorean triplet is a set of three natural numbers, {a, b, c}, for which,
# a**2 + b**2 = c**2.

# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.


class Triplet
  def self.where(max_factor:, min_factor: 1, sum: nil)
    # triplets = (min_factor..max_factor).to_a.combination(3).map { |nums| new(*nums) }
    # triplets.select { |triplet| triplet.pythagorean? && (sum.nil? || triplet.sum == sum) }

    triplets = combination(max_factor, min_factor)
    triplets.reject { |triplet| sum&.!= triplet.sum }
  end

  def self.combination(max, min)
    (min..max - 2).each.with_object([]) do |a, combos|
      (a + 1..max - 1).each do |b|
        (b + 1..max).each do |c|
          break unless a + b > c
          triplet = new(a, b, c)
          # combos[triplet] ||= true if triplet.pythagorean?
          combos << triplet if triplet.pythagorean?
        end
      end
    end#.keys
  end

  attr_reader :nums

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
    @nums.first.abs2 + @nums[1].abs2 == @nums.last.abs2
  end
end


def factors(num)
  (1...num).select { |n| num % n == 0 }
end