# easy1_04.rb

# Divisors

# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence you
# wish.

def divisors(num)
  (1..num**0.5).select { |n| (num % n).zero? }
                      .flat_map { |n| [n, num / n] }
                      .uniq
                      .sort
end


def divisors(num)
  (1..num**0.5).flat_map { |n| [n, num / n] if (num % n).zero? }.compact.uniq.sort
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# p divisors(0) == []
# p divisors(999962000357) == [1, 999979, 999983, 999962000357]
# puts

def time_seconds
  time_before = Time.now
  result = yield
  puts "Seconds: #{Time.now - time_before}"
  result
end

def divisors(number)
  return [number] if number == 1
  interval = number.even? ? 1 : 2

  (1..(number**0.5).floor).step(interval).with_object([]) do |n, divs|
    divs.concat([n, number/n]) if number % n == 0
  end.sort
end



# require 'prime'

# def divisors(num)
#   return [] if num == 0
#   num.prime_division.flatten.uniq.map
# end


# def divisors(number)
#    return [] if number == 0
#   div_list = number.prime_division
#   div_list = div_list.flatten.uniq
#   div_list.each do |denom|
#     factor = (number / denom)
#     div_list << factor if !div_list.include?(factor)
#   end.sort
# end

require 'prime'

def divisors(int)
  return [] if int == 0
  # Get all prime factors and their exponent of int
  # 12 = 2^2 * 3^1
  # prime_division will return [[2, 2], [3, 1]]  ==  2^2 * 3^1
  # then transpose that array to segregate the primes and exponents
  # == [[2, 3], [2, 1]]  ( [[prime numbers], [exponents of primes]] )
  # then multiple assign to primes, powers
  # prime == [2, 3]
  # power == [2, 1]
  primes, powers = int.prime_division.transpose

  # If there are no prime numbers factors, return an array of [1, int] uniques
  return [1, int].uniq if primes.nil?

  # else:
  # Create an array of exponent ranges for each prime
  # for the prime 2, we have an exponent of 2, so the first array would look like [0, 1, 2]
  # for the prime 3, the exponent is 1 => [0, 1]
  # #map returns => [[0, 1, 2], [0, 1]]
  exponents = powers.map{|i| (0..i).to_a}

  # Here, we assign the divisors variable to an array of all of the divisors of int by:
  # 1: Removing the first array of exponents, returning it, and calling #product on the remaining arrays
  # => [0, 1, 2].product([0, 1])
  # returns [[0, 0], [0, 1], [1, 0], [1, 1], [2, 0], [2, 1]]
  #
  # 2. each set of exponents are passed into #map as powers
  divisors = exponents.shift.product(*exponents).map do |powers|

    # 3. We take the prime numbers and zip the block parameter powers into it
    # First iteration:  [2, 3].zip([0, 0]) => [[2, 0], [3, 0]]
    # Second iteration: [2, 3].zip([0, 1])
    # and so on...
    #
    # For each iteration, the zipped array is passed into #map again, where we pass in each
    # sub-array element and assign prime and power block variables
    #
    # First iteration : prime = 2, power = 0
    # Second iteration: prime = 3, power = 0
    #
    # The block evaluates the prime block parameter to the power of the block parameter power
    # The resultant mapped array is then sent to #inject using #* method
    # First iteration: 2**0 == 1
    # Second iteration: 3**0 == 1
    # Now we would have: [1, 1]
    # And call inject(:*) : [1, 1].inject(:*)
    # would return 1
    # and so on for each iteration...
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end

  divisors.sort
end

def divisors(int)
  return [int] if int < 2
  primes, powers = int.prime_division.transpose
  exponents = powers.map { |power| (0..power).to_a }
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime**power}.reduce(:*)
  end
  divisors.sort
end

def divisors(int)
  return [int] if int < 2
  primes, powers = int.prime_division.transpose
  exponents = powers.map { |power| (0..power).to_a }
  exponents = exponents.first.product(*exponents.drop(1))
  divisors = exponents.map do |powers|
    primes.zip(powers).map{|prime, power| prime**power}.reduce(:*)
  end
  divisors.sort
end


p time_seconds { divisors(1) }#== [1] }
p time_seconds { divisors(7) }#== [1, 7] }
p time_seconds { divisors(12) }#== [1, 2, 3, 4, 6, 12] }
p time_seconds { divisors(98) }#== [1, 2, 7, 14, 49, 98] }
p time_seconds { divisors(99400891) }#== [1, 9967, 9973, 99400891] }
p time_seconds { divisors(0) }#== [] }
p time_seconds { divisors(120) }#== [] }
p time_seconds { divisors(999962000357) }#== [1, 999979, 999983, 999962000357] }
# p time_seconds { divisors(99996200035785723845) }
p time_seconds { divisors(999962000356) }#==  [1, 2, 4, 11, 22, 44, 71, 142, 284, 781, 1562, 3124, 320090269, 640180538, 1280361076, 3520992959, 7041985918, 14083971836, 22726409099, 45452818198, 90905636396, 249990500089, 499981000178, 999962000356] }
# p time_seconds { divisors(999962000356878787) }




# def divisors(num)
#   divisors = Prime.prime_division(num).flatten.uniq
#   divisors.sort << num
# end


# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# p divisors(0) == []
# p divisors(999962000357) == [1, 999979, 999983, 999962000357]
# puts
