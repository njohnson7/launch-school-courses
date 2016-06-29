# medium2_07_unlucky_days.rb
# Unlucky Days

# Write a method that returns the number of Friday the 13ths in the year passed
# in as an argument. You may assume that the year is greater than 1752 (when the
# modern Gregorian Calendar was adopted by the United Kingdom), and you may
# assume that the same calendar will remain in use for the foreseeable future.

def friday_13th?(year)
  count = 0
  1.upto(12).each { |month| count += 1 if Time.new(year, month, 13).friday? }
  count
end

p friday_13th?(2015) #== 3
p friday_13th?(1986) #== 1
p friday_13th?(2000)
p friday_13th?(2050)
puts


# Book solution:
require 'date'

def friday_13th?(year)
  count = 0
  thirteenth = Date.new(year, 1, 13)
  11.times do
    count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  count
end

p friday_13th?(2015) #== 3
p friday_13th?(1986) #== 1
p friday_13th?(2000)
p friday_13th?(2050)
puts


# There are a few different variations on this problem. What about finding the
# each lucky day of the month(7th of the month).
def lucky_days(year)
  days = [Date.new(year, 1, 7)]
  11.times { days << days.last.next_month }
  days.map { |day| day.strftime('%A') }.join(', ')
end

p lucky_days(2015)
p lucky_days(1986)
p lucky_days(2000)
p lucky_days(2050)
puts


# We could also try and find the 2nd to last day of the month. For this last
# case, we would need to account for leap years.
def second_to_last_days_of_month(year)
  days = []
  2.upto(12) { |month| days << Date.new(year, month, 1) - 2 }
  days << Date.new(year + 1, 1, 1) - 2
  days.map { |day| (day).strftime('%A %m-%d') }.join(', ')
end

p second_to_last_days_of_month(2015)
p second_to_last_days_of_month(1986)
p second_to_last_days_of_month(2000)
p second_to_last_days_of_month(2050)
p second_to_last_days_of_month(2016)
