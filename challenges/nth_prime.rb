# Write a program that can tell you what the nth prime is.

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.

# Do not use Ruby's Prime class nor any of the prime-number testing methods in
# the Integer class. For an algorithm to determine whether a number is prime,
# check out this article.

# input: nth
# output: nth Prime
# algorithm:
  # generate n primes and take last

# require 'set'

# module Prime
#   def self.nth(num)
#     # primes = Set.new
#     primes = {}
#     current = 2
#     idx = 1
#     until idx == num
#       # primes << current
#       primes[current.abs2] = current
#       # p primes
#       current = next_prime(current, primes)
#       idx += 1
#     end

#     current
#   end

#   def self.next_prime(current, primes)
#     # current += 1 if current.even?
#     loop do
#       current += 1
#       # return current if (primes.none? do |square, num|
#       #   return current if square > current
#       #   current % num == 0
#       # end)

#       primes.none? { |sq, n| sq > current ? (return current) : (current % n).zero? }
#     end
#   end

# end

# class Prime
#   def self.nth(num)
#     raise ArgumentError unless num.positive?
#     primes = {}
#     (1...num).reduce(2) do |current, _|
#       primes[current.abs2] = current
#       next_prime(current, primes)
#     end
#   end

#   def self.next_prime(current, primes)
#     current -= 1 if current.even?
#     loop do
#       current += 2
#       # primes.none? { |sq, n| sq > current ? (return current) : (current % n).zero? }
#       primes.each { |sq, n| sq > current ? (return current) : (break if (current % n).zero?) }
#       # next if primes.any? { |sq, n| sq > current ? (return current) : (current % n).zero? }
#     end
#   end
# end

# recursive, and calculates the 200_000th prime number in ~4.5 seconds, whereas
#  the top 3 solutions take ~40, ~39, and ~7 seconds, respectively, and the
#  fastest submitted solution takes ~5+ seconds.

# recursive, and calculates the 300_000th prime number in ~7.5 seconds, whereas
#  the top 3 solutions take ~82, ~72, and ~11 seconds, respectively, and the
#  fastest submitted solution takes ~10 seconds.

class Prime
  class << self
    def nth(num)
      raise ArgumentError unless num.positive?
      return 2 if num == 1
      primes = {}
      (2...num).reduce(3) do |current, _|
        primes[current] = current.abs2
        next_prime(current + 2, primes)
      end
    end

    def next_prime(current, primes)
      primes.each do |prime, square|
        return current if square > current
        break if (current % prime).zero?
      end
      next_prime(current + 2, primes)
    end
  end
end

class Prime
  def self.nth(n)
    raise ArgumentError if n < 1

    current_number = 2
    prime_count = 0

    loop do
      prime_count += 1 if is_prime?(current_number)
      break if prime_count == n
      current_number += 1
    end
    current_number
  end

  private

  def self.is_prime?(num)
    (2..Math.sqrt(num)).none? { |divisor| num % divisor == 0 }
  end
end

# class Prime
#   def self.nth(num)
#     raise ArgumentError unless num.positive?
#     return 2 if num == 1
#     primes = { 4 => 2 }
#     idx = 1
#     current = 1
#     until idx >= num
#       current += 2
#       if prime?(current, primes)
#         primes[current.abs2] = current
#         idx += 1
#       end
#     end
#     current
#   end

#   def self.prime?(current, primes)
#     primes.each do |square, prime|
#       return true if square > current
#       return false if (current % prime).zero?
#     end
#   end
# end



# class Prime        # 82
#   def self.nth(n)
#     fail ArgumentError if n < 1
#     primes = [2]
#     current_test = 3
#     until primes.size == n
#       primes << current_test if prime?(current_test)
#       current_test += 2
#     end
#     primes.last
#   end

#   def self.prime?(number)
#     (2..Math.sqrt(number)).each do |test|
#       return false if number % test == 0
#     end
#     true
#   end
# end


# class Prime     # 72
#   class << self
#     def nth(num)
#       raise ArgumentError if num < 1

#       primes(num).last
#     end

#     private

#     def prime?(n)
#       (2..Math.sqrt(n)).each { |divisor| return false if n % divisor == 0 }
#       true
#     end

#     def primes(amount)
#       index = 2
#       results = []
#       while results.size < amount
#         results << index if prime?(index)
#         index += 1
#       end

#       results
#     end
#   end
# end


# class Prime       # 11
#   def self.nth(num)
#     fail ArgumentError unless num > 0
#     @primes = [2]
#     current_num = 3
#     while @primes.length < num
#       @primes << current_num if is_prime?(current_num)
#       current_num += 2
#     end
#     @primes.last
#   end

#   def self.is_prime?(num)
#     @primes.each do |prime|
#       return false if num % prime == 0
#       break true if prime > Math.sqrt(num)
#     end
#   end
# end


# class Prime     # 10
#   @primes = [2, 3]

#   def self.nth(number)
#     raise ArgumentError if number < 1
#     nth_prime_index = number - 1
#     current_odd_num = @primes.last

#     until @primes[nth_prime_index]
#       current_odd_num += 2
#       @primes << current_odd_num if next_prime?(current_odd_num)
#     end

#     @primes[nth_prime_index]
#   end

#   def self.next_prime?(number)
#     max_factor = number**0.5

#     @primes.each do |prime|
#       return true if prime > max_factor
#       return false if number % prime == 0
#     end
#   end
# end