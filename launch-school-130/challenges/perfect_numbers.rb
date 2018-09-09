# The Greek mathematician Nicomachus devised a classification scheme for natural
# numbers, identifying each as belonging uniquely to the categories of abundant,
# perfect, or deficient. A perfect number equals the sum of its positive
# divisors — the pairs of numbers whose product yields the target number,
# excluding the number itself. This sum is known as the Aliquot sum.

    # Perfect:   Sum of factors = number
    # Abundant:  Sum of factors > number
    # Deficient: Sum of factors < number

# Examples:

    # 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
    # 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
    # Prime numbers 7, 13, etc are deficient by the Nicomachus classification.

# Write a program that can tell if a number is perfect, abundant or deficient.


# input: Integer
  # raise RuntimeError if num <= 0
# output: 'deficient', 'perfect', or 'abundant'
  # deficient: sum of factors < num
  # perfect: sum of factors == num
  # abundant: sum of factors > num
# algorithm:
  # create array of factors of num
  # reduce factors to get sum
  # apply rules and return result

class PerfectNumber
  def self.classify(num)
    raise 'must be positive Integer' unless num.is_a?(Integer) && num.positive?
    sum = (2..(num**0.5).floor).select { |n| (num % n).zero? }
                               .flat_map { |n| [n, num / n] }
                               .reduce(1, :+)
    %w[perfect abundant deficient][sum <=> num]
  end
end

class PerfectNumber
  def self.classify(num)
    raise 'must be positive Integer' unless num.is_a?(Integer) && num.positive?
    sum = (1..num / 2).select { |n| (num % n).zero? }.reduce(0, :+)
    %w[perfect abundant deficient][sum <=> num]
  end
end


class PerfectNumber
  def self.classify(num)
    raise 'must be positive Integer' unless num.is_a?(Integer) && num.positive?
    sum = (2..(num**0.5).floor).flat_map { |n| [n, num / n] if (num % n).zero? }
                               .compact.reduce(1, :+)
    %w[perfect abundant deficient][sum <=> num]
  end
end



class PerfectNumber
  def self.classify(num)
    raise 'must be positive Integer' unless num.is_a?(Integer) && num.positive?
    sum = (2..(num**0.5).floor).reduce(1) do |sum, n|
      (num % n).zero? ? sum + n + num / n : sum
    end
    %w[perfect abundant deficient][sum <=> num]
  end
end


class PerfectNumber
  def self.classify(num)
    raise 'must be positive Integer' unless num.is_a?(Integer) && num.positive?
    %w[perfect abundant deficient][sum_of_factors(num) <=> num]
  end

  def self.sum_of_factors(num, n = 1)
    n == num ? 0 : sum_of_factors(num, n + 1) + (num % n == 0 ? n : 0)
  end
end
