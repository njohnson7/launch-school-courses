require 'optparse'

options = OptionParser.new do |opts|
  ('a'..'z').each do |letter|
    opts.on("-#{letter}", "Option #{letter.upcase}") do
    end
  end

  opts.banner = 'Usage: ex3.rb [options]'
end

options.parse!

puts options
