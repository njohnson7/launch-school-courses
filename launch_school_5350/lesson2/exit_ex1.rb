i = 1

at_exit { puts " Well, at least I got to #{i}." }

loop do
  break if i == 10
  puts i
  sleep 1
  i += 1
end
