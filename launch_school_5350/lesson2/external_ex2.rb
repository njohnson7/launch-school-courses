require 'shellwords'

msg = Shellwords.escape ARGV.first

puts `git add -A`
puts `git commit -m '#{msg}'`
