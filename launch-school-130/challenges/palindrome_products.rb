# Write a program that can detect palindrome products in a given range.

# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers (range 10 ~ 99) is 9009 = 91 x 99.


class Palindromes
  attr_reader :largest, :smallest

  def initialize(max_factor:, min_factor: 1)
    @nums = *min_factor..max_factor
  end

  def generate
    # @range.to_a.repeated_combination(2).select { |a, b| palindrome?("#{a * b}") }
    # @range.to_a.repeated_combination(2).map do |a, b|
    #   product = a * b
    #   [product, [a, b]] if palindrome?(product.to_s)
    # end.compact.group_by(&:first)

    min, max = @nums.repeated_combination(2)
                    .group_by { |a, b| a * b }
                    .select { |product, _| product.to_s == product.to_s.reverse }
                    .minmax
    @smallest = Palindrome.new(min)
    @largest = Palindrome.new(max)
  end
end

Palindrome = Struct.new(:factors, :value) do
  def initialize(value_and_factors)
    self.value, self.factors = value_and_factors
  end
end





class Palindromes
  attr_reader :largest, :smallest

  def initialize(max_factor:, min_factor: 1)
    @nums = *min_factor..max_factor
  end

  def generate
    min_max = @nums.repeated_combination(2)
                   .group_by { |a, b| a * b }
                   .select { |prod, _| prod.to_s == prod.to_s.reverse }
                   .minmax
    %w[smallest largest].zip(min_max).each do |ivar_name, value|
      instance_variable_set("@#{ivar_name}", Palindrome.new(value))
    end
  end
end




class Palindromes
  Palindrome = Struct.new(:value, :factors)

  attr_reader :largest, :smallest

  def initialize(max_factor:, min_factor: 1)
    @nums = *min_factor..max_factor
  end

  def generate
    @nums.repeated_combination(2)
         .group_by { |num1, num2| num1 * num2 }
         .select { |prod, _| (prod = prod.to_s) && prod == prod.reverse }
         .minmax
         .zip(%w[smallest largest]) do |(prod, factors), ivar_name|
           instance_variable_set("@#{ivar_name}", Palindrome.new(prod, factors))
         end
  end
end







class Palindromes
  attr_reader :largest, :smallest

  def initialize(max_factor:, min_factor: 1)
    @min, @max = min_factor, max_factor
    @smallest = SmallestPalindrome.new
    @largest = LargestPalindrome.new
  end

  def generate
    @min.upto(@max) do |small_num|
      @max.downto(@min) do |big_num|
        break if small_num > big_num
        product = small_num * big_num
        product_str = product.to_s
        next unless product_str == product_str.reverse

        factors = [small_num, big_num]
        smallest.update(product, factors)
        largest.update(product, factors)
      end
    end
  end
end

Palindrome = Struct.new(:factors, :value) do
  def initialize(start_value)
    self.factors = []
    self.value = start_value
  end

  def update(product, new_factors, operator)
    return unless product.send(operator, value)
    if product == value
      factors << new_factors unless factors.include?(new_factors)
    else
      self.value = product
      self.factors = [new_factors]
    end
  end
end

class LargestPalindrome < Palindrome
  def initialize
    super(0)
  end

  def update(product, new_factors)
    super(product, new_factors, :>=)
  end
end

class SmallestPalindrome < Palindrome
  def initialize
    super(10_000_000)
  end

  def update(product, new_factors)
    super(product, new_factors, :<=)
  end
end



# pal = Palindromes.new(max_factor: 9)
# p pal.generate
# p pal.largest
# p pal.largest.value
# p pal.largest.factors
# puts
# p pal.smallest
# p pal.smallest.value
# p pal.smallest.factors

# pal = Palindromes.new(max_factor: 99, min_factor: 10)
# p pal.generate



