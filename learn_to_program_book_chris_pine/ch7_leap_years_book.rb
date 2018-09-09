# ch7_leap_years_book.rb


print "Please enter starting year: "
start_year = gets.chomp.to_i
print "Please enter ending year: "
end_year = gets.chomp.to_i

puts "These years are leap years:"

(start_year..end_year).each do |year|
  next if year % 4 != 0
  next if year % 100 == 0 && year % 400 != 0
  puts year
end