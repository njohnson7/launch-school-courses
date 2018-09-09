# ch14_proc_time_practice.rb



def profile(block_description, &block)
  start_time = Time.new
  block.call
  duration = Time.new - start_time
  puts "#{block_description}: #{duration} seconds"
end

profile('25,000 doublings') do
  number = 1
  25_000.times { number += number }
  puts "#{number.to_s.length} digits"       # the number of digits in this HUGE number
end

profile('count to a million') do
  number = 0
  1_000_000.times { number += 1 }
end