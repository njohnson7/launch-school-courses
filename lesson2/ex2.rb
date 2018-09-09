# $ ruby program.rb -h
# Usage: program.rb [options]
#     -v                               Enable verbose logging
#     -n NUMBER                        Use number
# $ ruby program.rb
# Verbose is false
# Number is 1
# $ ruby program.rb -v -n 45
# Verbose is true
# Number is 45


require 'optparse'

verbose = false
number  = 1

options = OptionParser.new do |opts|
  opts.banner = 'Usage: program.rb [options]'

  opts.on('-v', 'Enable verbose logging') do
    verbose = true
  end

  opts.on('-n NUMBER', 'Use number') do |n|
    number = Integer n
  end
end

options.parse!

puts "Verbose is #{verbose}"
puts "Number is #{number}"
