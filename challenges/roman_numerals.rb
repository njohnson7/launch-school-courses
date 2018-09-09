# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these
# letters have lots of straight lines and are hence easy to hack into stone
# tablets).

#  1  => I
# 10  => X
#  7  => VII

# There is no need to be able to convert numbers larger than about 3000. (The
# Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit
# separately starting with the left most digit and skipping any digit with a
# value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals 1990
# is MCMXC:

# 1000=M
# 900=CM
# 90=XC

# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII


# algorithm:
  # find ones: num % 10
    # 1-3: I,  II,  III
    # 4:   IV
    # 5:   V
    # 6-8: VI, VII, VIII
    # 9:   IX
  # find tens:
    # 1-3: X,  XX,  XXX
    # 4:   XL
    # 5:   L
    # 6-8: LX, LXX, LXXX
    # 9:   XC
  # find hundreds:
    # 1-3: C,  CC,  CCC
    # 4:   CD
    # 5:   V
    # 6-8: DC, DCC, DCCC
    # 9:   CM
  # find 1000's
    # 1-3: M, MM, MMM

# class Integer
#   ONES = [''] +      %w[I II III IV V VI VII VIII IX]
#   TENS = [''] +      %w[X XX XXX XL L LX LXX LXXX XC]
#   HUNDREDS = [''] +  %w[C CC CCC CD D DC DCC DCCC CM]
#   THOUSANDS = [''] + %w[M MM MMM]
#   ROMANS = [THOUSANDS, HUNDREDS, TENS, ONES]

#   def to_roman
#     ones = self % 10
#     tens = self / 10 % 10
#     hundreds = self / 100 % 10
#     thousands = self / 1000
#     nums = [thousands, hundreds, tens, ones]
#     ROMANS.zip(nums).reduce('') { |result, (roman, num)| result + roman[num] }
#   end
# end


# class Integer
#   ROMANS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90,
#              L: 50,   XL: 40,  X: 10,  IX: 9,   V: 5,   IV: 4, I: 1 }

#   def to_roman(num = self)
#     ROMANS.reduce('') { |str, (k, v)| (n, num = num.divmod(v)) && str + k.to_s * n }
#   end
# end

# class Integer
#   ROMANS = { M: 1000, CM: 900, D: 500, CD: 400,
#              C:  100, XC:  90, L:  50, XL:  40,
#              X:   10, IX:   9, V:   5, IV:   4,
#              I:    1 }.freeze

#   def to_roman(num = self)
#     ROMANS.reduce('') do |result, (roman, value)|
#       amount, num = num.divmod(value)
#       result + roman.to_s * amount
#     end
#   end
# end


class Integer
  ROMS = [%W[#{} M MM MMM], %W[#{} C CC CCC CD D DC DCC DCCC CM],
          %W[#{} X XX XXX XL L LX LXX LXXX XC], %W[#{} I II III IV V VI VII VIII IX]]

  def to_roman
    nums = [self / 1000, self / 100 % 10, self / 10 % 10, self % 10]
    ROMS.zip(nums).reduce('') { |str, (rom, num)| str + rom[num] }
  end
end


p 5.to_roman
p 15.to_roman
p 19.to_roman
p 99.to_roman
p 45.to_roman
p 49.to_roman
p 51.to_roman
p 101.to_roman
p 400.to_roman
p 929.to_roman
p 1350.to_roman
p 2999.to_roman
p 3000.to_roman

