# exercise2.rb
# Looks at current directory and reports files that have .txt extensions

# I did this exercise in irb, but this file is just for reference



require 'pathname'

pn = Pathname.new(".")
pn.entries.each { |f| puts "#{f} has extension .txt" if f.extname == ".txt" }