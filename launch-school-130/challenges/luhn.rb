# input: Integer
# output:
  # valid? method: return true/false
  # checksum method: return checksum
  # addends method:
    # append a check digit to make number valid, and return num + digit
      # ex: "2323 2005 7766 355" -> "2323 2005 7766 3554"
# rules:
  # rightmost digit = the check digit
  # valid:
    # counting from rightmost digit, double every 2nd digit
    # for any doubled digits that become > 10, subtract 9 from result
    # add all resulting digits together to get checksum
    # valid: checksum % 10 == 0
      # 1111 -> 2121 -> 6  -> invalid
      # 8763 -> 7733 -> 20 -> valid

class Luhn
  def self.create(num)
    "#{num}#{(0..9).find { |n| new("#{num}#{n}".to_i).valid? }}".to_i
  end

  def initialize(num)
    @digits = num.digits
  end

  def addends
    @digits.map.with_index { |n, i| i.even? ? n : ((n * 2) % 9.5).ceil }.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end
end

# p Luhn.new(12_121).addends
# p Luhn.new(8631).addends

# p Luhn.create(123)          # 1230
# p Luhn.create(873_956)      # 8_739_567
# p Luhn.create(837_263_756)  # 8_372_637_564

