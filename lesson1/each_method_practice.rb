# each_method_practice.rb

class Array
  def eech
    return to_enum unless block_given?

    idx = 0
    while idx < size
      yield(self[idx])
      idx += 1
    end

    self
  end
end

p [1, 2, 3].eech { |n| p n }
p [].eech
p [].eech { |n| p n }
p [1, 2, 3].eech { p 'wordz' }
puts '-------'
puts

p [1, 2, 3].each { |n| p n }
p [].each
p [].each { |n| p n }
p [1, 2, 3].each { p 'wordz' }
puts '-------'
puts


def each(arr)
  return arr.to_enum unless block_given?
  idx = 0
  until idx == arr.size
    yield(arr[idx])
    idx += 1
  end
  arr
end

p each([1,2,3]) { |n| p n }
p each([])
p each([]) { |n| p n }
p each([1, 2, 3]) { p 'wordz' }
puts '-----'
puts


p [1, 2, 3].eech { |n| 'do nothing' }
arr = %w[a b c d e]
p arr.eech(&:upcase!)
p arr
p [1, 2, 3].eech { |n| 'do nothing' }.select(&:odd?)
