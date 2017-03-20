# medium1_09.rb

def factorial_enum
  Enumerator.new do |y|
    num = multiplier = 1
    loop do
      y << num
      num *= multiplier
      multiplier += 1
    end
  end
end

p factorial = factorial_enum
7.times { p factorial.next }
puts

p factorial.rewind
factorial.each_with_index do |n, idx|
  p n
  break if idx == 6
end
puts

p factorial.take(7)
puts


p 'eval:'
eval('p factorial.next;' * 7)
puts
puts


factorial = Enumerator.new do |y|
  num, multiplier = 1, 0
  loop do
    y << num
    num *= (multiplier += 1)
  end
end

eval('p factorial.next;' * 7)
# we don't need to call #rewind here because using #next doesn't affect most
#  internal enumeration methods
puts factorial.take(7)


puts
factorial.rewind
p factorial.take(7)
p factorial.next
p factorial.next
p factorial.next
