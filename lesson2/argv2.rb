require 'optparse'

verbose = false
number = 1

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
