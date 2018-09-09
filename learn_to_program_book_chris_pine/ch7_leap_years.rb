# ch7_leap_years.rb




print "Please enter starting year: "
start_year = gets.chomp.to_i
print "Please enter ending year: "
end_year = gets.chomp.to_i

puts "These years are leap years:"

while start_year <= end_year
  if start_year % 4 == 0
    if start_year % 100 == 0
      if start_year % 400 == 0
        puts start_year
        start_year += 1
      else
        start_year += 1
      end
    else
      puts start_year
      start_year += 1
    end
  else
    start_year += 1
  end
end