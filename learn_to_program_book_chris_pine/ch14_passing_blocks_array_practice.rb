# ch14_passing_blocks_array_practice.rb



class Array
  def each_even(&was_a_block__now_a_proc)       # & goes before a block that u want to turn into a proc inside the method
    is_even = true        # we start w/ true b/c arrays start w/ 0, which is even
    self.each do |object|
      was_a_block__now_a_proc.call(object) if is_even
      is_even = !is_even        # toggle from even to odd, or odd to even
    end
  end
end

fruits = ['apple', 'bad apple', 'cherry', 'durian']
fruits.each_even { |fruit| puts "Yum! I just love #{fruit} pies, don't you?" }

[0, 1, 2, 3, 4, 5].each_even { |num| puts "#{num} is an even number." }