msg = ARGV.first.gsub("'", "\'")

puts `git add -A`
puts `git commit -m '#{msg}'`




