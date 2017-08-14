
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

