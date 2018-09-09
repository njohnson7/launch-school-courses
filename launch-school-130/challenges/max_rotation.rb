def max_rotation(num, idx = 0)
  num = num.to_s.chars
  return num.join.to_i if idx == num.size - 1
  max_rotation((num[0...idx] + num[idx..-1].rotate).join, idx + 1)
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15  #the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
