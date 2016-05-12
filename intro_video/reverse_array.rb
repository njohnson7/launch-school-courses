# reverse_array.rb



def reverse_array(array)
  reversed = []
  length = array.length
  idx = 0
  while idx < length
    reversed << array.pop
    idx += 1
  end
  reversed
end

p reverse_array((1..10).to_a)


def reverse_string(string)
  reversed = ""
  idx = string.length - 1
  while idx >= 0
    reversed << string[idx]
    idx -= 1
  end
  reversed
end

puts reverse_string("What is this even?")