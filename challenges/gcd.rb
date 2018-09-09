def gcd(a, b)
  a.gcd(b)
end

def gcd(a, b)
  min, max = [a, b].minmax
  min.downto(1).find { |n| a % n == 0 && b % n == 0 }
end

def gcd(a, b)
  ([a, b].min).downto(1).find { |n| (a % n).zero? && (b % n).zero? }
end

def gcd(a, b)
  ([a, b].min).downto(1).find { |n| [a, b].all? { |x| (x % n).zero? } }
end

# 2 `gcd` solutions - both can accept 0+ arguments and argument can be nil:

# not using Integer#gcd:
def gcd(*nums)
  (nums.min.to_i).downto(1).find { |n| nums.all? { |num| (num % n).zero? } }
end

# using Integer#gcd:
def gcd(*nums)
  nums.reduce(:gcd)
end

p gcd(9, 15)   == 3
p gcd(100, 11) == 1
p gcd(14, 28)  == 14

p gcd(10) == 10
p gcd(9, 15) == 3
p gcd(14, 28, 42) == 14
p gcd(3, 5, 6, 10, 21) == 1
p gcd(10, 100, 150, 2000) == 10
p gcd == nil
p gcd(nil) == nil