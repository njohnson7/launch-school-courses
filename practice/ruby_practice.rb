def order_weight(str)
  weights = str.split.map do |num_str|
    [num_str.chars.map(&:to_i).reduce(:+), num_str]
  end

  weights.sort
         .map(&:last)
         .join(' ')
end

def order_weight(str)
  str.split.map { |num| [num.chars.map(&:to_i).reduce(:+), num] }
     .sort.map(&:last).join(' ')
end

def order_weight(str)
  str.split
     .sort_by { |num| [num.chars.map(&:to_i).reduce(:+), num] }
     .join(' ')
end

p order_weight("103 123 4444 99 2000") == "2000 103 123 4444 99"

p order_weight("2000 10003 1234000 44444444 9999 11 11 22 123") ==
  "11 11 2000 10003 22 123 1234000 44444444 9999"

[9, '81'] <=> [9, '9']
[9, '81'] <=> [9, '72']