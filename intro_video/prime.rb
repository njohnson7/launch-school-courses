# prime.rb
# write a method that takes 2 nums. it should print out all primes b/w the 2 nums. don't use 'prime' class


require 'pry'

def find_primes(num1, num2)
  raise "ERROR: Number must be greater than 0." if num1 <= 0 || num2 <= 0
  raise "ERROR: First number must be less than second number." if num1 > num2
  primes = []
  (num1..num2).each do |n|
    counter = 2
    prime = true
    while counter < n
      prime = false if n % counter == 0
      counter += 1
      binding.pry
    end
    prime = false if n == 1
    primes << n if prime == true
  end
  puts primes.join(', ')
end





find_primes(3, 10)        # => 3, 5, 7
puts
find_primes(1, 100)
puts
find_primes(11,11)
puts
find_primes(10,10)