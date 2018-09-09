# ch10_shuffle.rb



def shuffle(array)
  shuffled = []
  random = []

  while random.length < array.length
    100_000.times { random << rand(array.length) }
    random.uniq!
  end

  random.each do |n|
    shuffled << array[n]
  end

  shuffled
end

array = ['tom','bob','fred', 'carl', 'alfred', 'fred', 'ned', 'eric', 'tom', 'joe', 'larry', 'todd', 'jeremy']
array2 = (1..20).to_a

p array
puts
p array.shuffle
puts
p shuffle(array)
puts

p array2
puts
p array2.shuffle
puts
p shuffle(array2)