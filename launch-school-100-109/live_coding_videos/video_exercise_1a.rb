# video_exercise_1a.rb
# write a method that will determine if an int is a prime. don't use prime class

def is_prime?(num)
  return false if num <= 1
  (2...num).each { |n| return false if num % n == 0 }
  true
end

puts is_prime?(3) # => true
puts is_prime?(4) # => false

(-100..200).each { |n| print "#{n} " if is_prime?(n) }
puts
puts
puts

# write a method that will take an ary of nums, and return only prime nums

def select_primes(ary)
  ary.select { |n| is_prime?(n) }
end

p select_primes([1, 2, 3, 4]) # => [2,3]
p select_primes([4, 6, 8, 10]) # => []
p select_primes((-100..200).to_a)

# write a method that will take an ary of nums, and return the num of primes in
#  the ary.

def count_primes(ary)
  select_primes(ary).length
end

puts count_primes([1, 2, 3, 4]) # => 2
puts count_primes([4, 6, 8, 10]) # => 0
puts count_primes((-100..200).to_a)
