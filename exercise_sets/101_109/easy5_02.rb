# easy5_02.rb
# After Midnight Part 1

# The time of day can be represented as the number of minutes before or after
#  midnight. If the number of minutes is positive, the time is after midnight.
#  If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns
#  the time of day in 24 hour format (hh:mm). Your method should work with any
#  integer input.

# You may not use ruby's Date and Time classes.

# Disregard Daylight Savings and Standard Time and other complications.

# 0..1439

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def minutes_to_time(minutes)
  while minutes >= MINUTES_PER_DAY
    minutes -= MINUTES_PER_DAY
  end

  minutes.divmod(MINUTES_PER_HOUR)
end

def time_of_day(minutes)
  hours, mins = minutes_to_time(minutes.abs)
  if minutes.negative?
    hours = (HOURS_PER_DAY - 1) - hours
    mins = MINUTES_PER_HOUR - mins
  end

  format('%02d:%02d', hours, mins)
end


p time_of_day(0) #=> "00:00"
p time_of_day(-3) #=> "23:57"
p time_of_day(35) #=> "00:35"
p time_of_day(-1437) #=> "00:03"
p time_of_day(3000) #=> "02:00"
p time_of_day(800) #=> "13:20"
p time_of_day(-4231) #=> "01:29"
puts


# Book solution:

def time_of_day(minutes)
  minutes = minutes % MINUTES_PER_DAY
  hours, mins = minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, mins)
end

p time_of_day(0) #=> "00:00"
p time_of_day(-3) #=> "23:57"
p time_of_day(35) #=> "00:35"
p time_of_day(-1437) #=> "00:03"
p time_of_day(3000) #=> "02:00"
p time_of_day(800) #=> "13:20"
p time_of_day(-4231) #=> "01:29"
puts


# How would you approach this problem if you were allowed to use ruby's Date
#  and Time classes? Suppose you also needed to consider the day of week?
#  (Assume that delta_minutes is the number of minutes before or after midnight
#  between Saturday and Sunday; in such a method, a delta_minutes value of -4231
#  would need to produce a return value of Thursday 01:29.)

def time_of_day(minutes)
  start_time = Time.new(2016, 6, 5)
  seconds = minutes * 60
  new_time = start_time + seconds

  new_time.strftime('%A %R')
end

p time_of_day(0) #=> "00:00"
p time_of_day(-3) #=> "23:57"
p time_of_day(35) #=> "00:35"
p time_of_day(-1437) #=> "00:03"
p time_of_day(3000) #=> "02:00"
p time_of_day(800) #=> "13:20"
p time_of_day(-4231) #=> "01:29"
p time_of_day(-1351) #=> "01:29"
p time_of_day(-686)
p time_of_day(-754)
p time_of_day(-721)
p time_of_day(-1439)
