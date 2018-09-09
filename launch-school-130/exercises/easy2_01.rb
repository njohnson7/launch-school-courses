# easy2_01.rb


def step(start, limit, increment)
  while start <= limit
    yield(start)
    start += increment
  end
  start - increment
end

def step(start, limit, increment)
  start -= increment
  yield(start += increment) while start <= limit - increment
end

# recursive:
def step(start, limit, increment, &block)
  start > limit ? return : block.call(start)
  step(start + increment, limit, increment, &block)
end

# def step(start, limit, increment, &block)
#   return start - increment if start > limit
#   block.call(start)
#   step(start + increment, limit, increment, &block)
# end

p step(1, 10, 3) { |value| puts "value = #{value}" }
p step(27, 101, 11) { |value| print "#{value}, " }
puts

# value = 1
# value = 4
# value = 7
# value = 10
