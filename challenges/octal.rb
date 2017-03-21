# input: Integer in base 8 notation
# output: convert input to decimal
# rules: don't use any built in conversion methods
# data structure: array of digits?
# algorithm:
  # convert num to array of digits
  # map -> multiply each digit by 8**idx
  # reduce products into sum

# class Octal
#   def initialize(num)
#     @invalid = true if num.match?(/[89\D]/)
#     @reversed_digits = num.chars.map(&:to_i).reverse
#   end

#   def to_decimal
#     return 0 if @invalid
#     @reversed_digits.map.with_index { |n, idx| n * 8**idx }.reduce(:+)
#   end
# end

class Octal
  def initialize(num)
    @num = num.match?(/[^0-7]/) ? '0' : num
  end

  def to_decimal
    @num.chars.reduce(0) { |sum, n| n.to_i + sum * 8 }
  end
end
