def generate_pattern(num)
  width = [*1..num].join.size
  puts (1..num).map { |n| [*1..n].join.ljust(width, '*')}
end

generate_pattern(20)
generate_pattern(33)