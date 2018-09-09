class Trinary
  def initialize(num)
    @num = num.match?(/[^012]/) ? '0' : num
  end

  def to_decimal
    @num.chars.reduce(0) { |sum, n| n.to_i + sum * 3 }
  end
end
