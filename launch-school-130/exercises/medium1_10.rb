# medium1_10.rb

def bubble_sort!(arr)
  n = arr.size
  loop do
    new_n = 0
    (1...n).each do |idx|
      if block_given?
          # ;require'pry';binding.pry;
        next unless yield(arr[idx], arr[idx - 1])
      else
        next unless arr[idx - 1] > arr[idx]
      end
      arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
      new_n = idx
    end
    return arr if new_n.zero?
    n = new_n
  end
end

def bubble_sort!(arr, n = arr.size)
  loop do
    new_n = 0
    (1...n).each do |i|
      next if (block_given? ? yield(arr[i - 1], arr[i]) : arr[i - 1] <= arr[i])
      arr[i - 1], arr[i], new_n = arr[i], arr[i - 1], i
    end
    new_n.zero? ? (return arr) : n = new_n
  end
end

# recursive (2 block args):
def bubble_sort!(arr, n = arr.size, &block)
  n.zero? ? (return arr) : new_n = 0
  (1...n).each do |i|
    next if (block ? block.call(arr[i - 1], arr[i]) : arr[i - 1] <= arr[i])
    arr[i - 1], arr[i], new_n = arr[i], arr[i - 1], i
  end
  bubble_sort!(arr, new_n, &block)
end

# recursive (1 block arg):
def bubble_sort!(arr, n = arr.size, &block)
  n.zero? ? (return arr) : new_n = 0
  (1...n).each do |i|
    a, b = block ? arr[i - 1, 2].map { |x| block.call(x) } : arr[i - 1, 2]
    next if a <= b
    arr[i - 1], arr[i], new_n = arr[i], arr[i - 1], i
  end
  bubble_sort!(arr, new_n, &block)
end

# recursive (1 or 2 block args):
def bubble_sort!(arr, n = arr.size, &block)
  n.zero? ? (return arr) : new_n = 0
  (1...n).each do |idx|
    a, b = arr[idx - 1, 2].map { |x| block&.arity == 1 ? block.call(x) : x }
    next if (block&.arity == 2 ? block.call(a, b) : a <= b)
    arr[idx - 1], arr[idx], new_n = arr[idx], arr[idx - 1], idx
  end
  bubble_sort!(arr, new_n, &block)
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [5, 3, 7]
bubble_sort!(array) { |value| -value }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |value| value % 7 }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)


# recursive (no blocks):
def bubble_sort!(arr, n = arr.size)
  n.zero? ? (return arr) : new_n = 0
  (1...n).each do |idx|
    next if arr[idx - 1] <= arr[idx]
    arr[idx - 1], arr[idx], new_n = arr[idx], arr[idx - 1], idx
  end
  bubble_sort!(arr, new_n)
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

nums = (1..100).map { |n| rand(1000) }
bubble_sort!(nums)
p nums == nums.sort
