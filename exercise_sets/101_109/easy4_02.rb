# easy4_02.rb
# What Century is That?

# Write a method that takes a year as input and returns the century. The return
#  value should a string that begins with the century number, and ends with
#  st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000
#  comprise the 20th century.

# Examples:

# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'

# CENTURY_SUFFIX = {
#   'th' => [0, 4, 5, 6, 7, 8, 9],
#   'st' => [1],
#   'nd' => [2],
#   'rd' => [3]
# }

CENTURY_SUFFIX = %w(th st nd rd th th th th th th)

def century(year)
  century_int = year / 100 + (year % 100 == 0 ? 0 : 1)
  suffix = if century_int == 11 || century_int == 12 || century_int == 13
             'th'
           else
             CENTURY_SUFFIX[century_int % 10]
           end

  century_int.to_s + suffix
end

p century(2000) #== '20th'
p century(2001) #== '21st'
p century(1965) #== '20th'
p century(256) #== '3rd'
p century(5) #== '1st'
p century(10103) #== '102nd'
p century(1840)
p century(1)
p century(25)
p century(100)
p century(101)
p century(300)
p century(401)
p century(999)
p century(1000)
p century(1001)
p century(1555)
p century(25124)
p century(546456)
p century(1000)
p century(1001)
p century(1100)
p century(1101)
p century(1201)
p century(1301)
