class Hex
  HEX_TO_DECIMAL = [*'0'..'9', *'A'..'F'].freeze

  def initialize(num)
    @num = num.match?(/[^0-9a-f]/i) ? '0' : num.upcase
  end

  def to_decimal
    @num.chars.reduce(0) { |sum, n| HEX_TO_DECIMAL.index(n) + sum * 16 }
  end
end


p Hex.new('ab314').to_decimal == 'ab314'.hex
p Hex.new('85f').to_decimal == '85f'.hex
p Hex.new('85fabcd8173').to_decimal == '85fabcd8173'.hex
p Hex.new('9870abcdef').to_decimal == '9870abcdef'.hex
p Hex.new('0123456789').to_decimal == '0123456789'.hex
p Hex.new('124g892').to_decimal == 0
p Hex.new('z').to_decimal == 0
p Hex.new('u83tjs').to_decimal == 0
