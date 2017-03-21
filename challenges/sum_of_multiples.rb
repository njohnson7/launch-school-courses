# Write a program that, given a number, can find the sum of all the multiples of
# particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are
# multiples of either 3 or 5, we get 3, 5, 6 and 9, 10, 12, 15, and 18. The sum
# of these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of
# numbers. If no set of numbers is given, default to 3 and 5.

# input: Integer limit
  # also, *nums passed in as arg (or [3, 5] by default)
# output: sum of multiples of [nums] up to limit - 1
# rules:
  # add up nums b/w (3..limit) where n % *multiple == 0

# class SumOfMultiples
#   def self.to(limit, nums = nil)
#     nums ||= [3, 5]
#     (1...limit).select { |n| nums.any? { |num| (n % num).zero? } }.reduce(0, :+)
#   end

#   def initialize(*nums)
#     @nums = nums unless nums.empty?
#   end

#   def to(limit)
#     self.class.to(limit, @nums)
#   end
# end


class SumOfMultiples
  def self.to(limit)
    new.to(limit)
  end

  def initialize(*nums)
    @nums = nums.empty? ? [3, 5] : nums
  end

  def to(limit)
    (1...limit).select { |n| @nums.any? { |num| (n % num).zero? } }.reduce(0, :+)
  end
end

p SumOfMultiples.new
p SumOfMultiples.new.to(50)          # 543
p SumOfMultiples.new(10).to(50)
p SumOfMultiples.new(10, 15).to(50)
p SumOfMultiples.to(50)              # 543
p SumOfMultiples.to(1)
