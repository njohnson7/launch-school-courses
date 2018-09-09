require "optparse"

options = OptionParser.new do |opts|
  opts.banner = "Usage: alpha_opt.rb [options]"

  opts.on("-v", "Display verbose output")
  opts.on("-o OUTFILE", "Use the specified outfile")
end

options.parse!

puts options

ARGV.each do |file|
  puts file
end
