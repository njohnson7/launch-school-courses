# times_method_practice.rb

class Integer
  def timez
    return create_enum(self) unless block_given?

    idx = 0
    loop do
      yield(idx)
      idx += 1
      break if idx == self
    end

    self
  end

  private

  def create_enum(limit)
    Enumerator.new do |y|
      n = 0
      loop do
        y << n
        n += 1
        break if n == limit
      end
    end
  end
end

p 5.timez
5.timez { |n| p n }
5.timez { puts 'wordz' }
puts

arr = []
p 3.timez { |n| arr << n + 1 }
p arr
puts

sum = 0
p 10.timez { |n| sum += 2 }
p sum
puts
puts '-----'

# test cases:
p 5.times
5.times { |n| p n }
5.times { puts 'wordz' }
puts

arr = []
p 3.times { |n| arr << n + 1 }
p arr
puts

sum = 0
p 10.times { |n| sum += 2 }
p sum
puts
puts '-------'

def times(num)
  return (0...num).to_enum(:times) unless block_given?

  idx = 0
  while idx < num
    yield(idx)
    idx += 1
  end

  num
end

p times(5) { |n| p n }
p times(5)
p times(5) { puts 'wordz' }
puts
puts '-----'

p 5.timez { |n| p n }
puts '--'
p times(5) { |n| p n }
puts '--'
p 5.times { |n| p n }
