# easy2_08.rb

def max_by(arr)
  return nil if arr.empty?
  max_elem = arr.first
  max_value = yield(max_elem)
  idx = 1
  while idx < arr.size
    elem = arr[idx]
    block_result = yield(elem)
    max_elem, max_value = [elem, block_result] if block_result > max_value
    idx += 1
  end
  max_elem
end

# using Enumerable#reduce:
def max_by(arr)
  arr.reduce { |max, elem| yield(max) > yield(elem) ? max : elem }
end

# recursive:
def max_by(arr, max = arr.first, &block)
  return max if arr.size <= 1
  max = block.call(max) > block.call(arr[1]) ? max : arr[1]
  max_by(arr.drop(1), max, &block)
end

# using Array#max (not sure if this is allowed...):
def max_by(arr)
  arr.max { |a, b| yield(a) <=> yield(b) }
end

# using Enumberable#sort_by (not sure if this is allowed...):
def max_by(arr)
  arr.sort_by { |elem| yield(elem) }.last
end











# CHECK HOW THIS WORKS!:

def max_by(collection)
  max_val = collection.first
  collection.each { |elmt| max_val = elmt if yield(elmt) > yield(max_val) }
  max_val
end












# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([-7, 8]) { |value| value * 3 } == 8
# p max_by([]) { |value| value + 5 } == nil


def letter_percentages(str)
  %i[lowercase uppercase neither].zip(%w[a-z A-Z ^a-zA-Z]).map do |type, pat|
    [type, str.count(pat).fdiv(str.size) * 100]
  end.to_h
end

# using Hash#transform_values (only works in Ruby 2.4+):
def letter_percentages(str)
  hsh = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }
  hsh.transform_values { |pattern| str.count(pattern).fdiv(str.size) * 100 }
end


# p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }


# using Hash#transform_values (only works in Ruby 2.4+):
def letter_case_count(str)
  hsh = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }
  hsh.transform_values { |pattern| str.count(pattern) }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }