# ch13_extend_built-in_classes.rb



class Array
  def shufflez
    shuffled = []
    random = []

    while random.length < self.length
      100_000.times { random << rand(self.length) }
      random.uniq!
    end

    random.each do |n|
      shuffled << self[n]
    end

    shuffled
  end
end

test_ary = (1..10).to_a
p test_ary.shuffle
p test_ary.shufflez

class Integer
  def factorial
    if self < 0
      return 'You can\'t take the factorial of a negative number!'
    elsif self <= 1
      1
    else
      self * (self - 1).factorial
    end
  end
end

puts 2.factorial
puts 3.factorial
puts 5.factorial
puts 8.factorial
puts 15.factorial



class Integer
  def to_roman
    roman_num = ""

    m = self / 1000
    roman_num << "M" * m

    d = self % 1000 / 500
    roman_num << "D" * d

    c = self % 1000 % 500 / 100
    roman_num << "C" * c

    l = self % 1000 % 500 % 100 / 50
    roman_num << "L" * l

    x = self % 1000 % 500 % 100 % 50 / 10
    roman_num << "X" * x

    v = self % 1000 % 500 % 100 % 50 % 10 / 5
    roman_num << "V" * v

    i = self % 1000 % 500 % 100 % 50 % 10 % 5 / 1
    roman_num << "I" * i

    roman_num.sub!("IIII", "IV")
    roman_num.sub!("VIV", "IX")

    roman_num.sub!("XXXX", "XL")
    roman_num.sub!("LXL", "XC")

    roman_num.sub!("CCCC", "CD")
    roman_num.sub!("DCD", "CM")

    roman_num
  end
end

puts 44.to_roman
puts 494.to_roman
puts 837.to_roman
puts 1999.to_roman
puts

p 7.factorial.to_roman.split(//).shufflez