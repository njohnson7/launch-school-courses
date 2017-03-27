# input: Integer - limit - ending num of a range
# output: all primes from 2 to limit
# rules:
  # use Sieve of Eratosthenes algorithm:
    # take the next available unmarked num in range (it is prime)
    # mark all multiples of that num (they are not prime)
    # repeat until every num has been processed
    # return all unmarked nums (primes)
# data structure: hash
# algorithm:
  # create a hash with nums as keys and nil as values
  # iterate thru hash
    # skip if value is false
    # if value is nil, change to true
      # then change value of all multiples of current num to false
        # mark multiples sub-method
  # return keys of hash elements that have a true value

# class Sieve
#   def initialize(limit)
#     raise ArgumentError, 'limit must be greater than 1' unless limit > 1
#     @limit = limit
#     @nums = (2..limit).map { |n| [n, true] }.to_h
#   end

#   def primes
#     @nums.each { |num, prime| mark_multiples(num) if prime }
#     @nums.compact.keys
#   end

#   def mark_multiples(num)
#     (num * 2).step(@limit, num).each { |multiple| @nums[multiple] = nil }
#   end
# end




# class Sieve
#   def initialize(limit)
#     raise ArgumentError, 'limit must be greater than 1' unless limit > 1
#     @limit = limit
#     @nums = (2..limit).map { |n| [n, nil] }.to_h
#   end

#   def primes
#     @nums.each do |num, prime|
#       next unless prime.nil?
#       mark_multiples(num)
#     end
#     @nums.select { |_, prime| prime.nil? }.keys
#   end

#   def mark_multiples(num)
#     (num * 2).step(@limit, num).each { |multiple| @nums[multiple] = true }
#   end
# end



class Sieve
  def initialize(limit)
    @limit = limit
    @nums = (2..limit).map { |n| [n, true] }.to_h
  end

  def primes
    @nums.each { |num, prime| mark_multiples(num) if prime }.compact.keys
  end

  private

  def mark_multiples(num)
    (num * 2).step(@limit, num).each { |multiple| @nums[multiple] = nil }
  end
end


# as

# class Sieve
#   def initialize(limit)
#     @limit = limit
#     @nums = [:marked, :marked] + Array.new(limit - 1, nil)
#   end

#   def primes
#     current_num = 2
#     loop do
#       prime = @nums[current_num..-1].index(nil)&.+(current_num)
#       break unless prime
#       mark_multiples(prime)
#       current_num = prime + 1
#     end
#     @nums.map.with_index { |marked, idx| idx if marked.nil? }.compact
#   end

#   private

#   def mark_multiples(prime)
#     (prime * 2).step(@limit, prime).each { |multiple| @nums[multiple] = :marked }
#   end
# end



require 'prime'

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

benchmark { p Sieve.new(1_000_000).primes == Prime.entries(1_000_000) }
# true, Seconds: ~1.6
