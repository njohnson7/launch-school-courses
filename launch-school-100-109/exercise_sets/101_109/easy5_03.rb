# easy5_03.rb
# After Midnight Part 2

# As seen in the previous exercise, the time of day can be represented as the
#  number of minutes before or after midnight. If the number of minutes is
#  positive, the time is after midnight. If the number of minutes is negative,
#  the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return
#  the number of minutes before and after midnight, respectively. Both methods
#  should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# Disregard Daylight Savings and Standard Time and other irregularities.

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
MIDNIGHT = Time.new(2000, 1, 1, 0, 0)

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  minutes + hours * MINUTES_PER_HOUR
end

def before_midnight(time)
  minutes = after_midnight(time)
  minutes == 0 ? 0 : MINUTES_PER_DAY - minutes
end

p after_midnight('00:00') #=> 0
p before_midnight('00:00') #=> 0
p after_midnight('12:34') #=> 754
p before_midnight('12:34') #=> 686
p after_midnight('01:29')
p before_midnight('01:29')
p before_midnight('11:26')
p before_midnight('11:59')
p before_midnight('00:01')
puts


# How would these methods change if you were allowed to use the Date and Time
#  classes?

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  ((MIDNIGHT - Time.new(2000, 1, 1, hours, minutes)) / 60).to_i.abs
end

def before_midnight(time)
  minutes = after_midnight(time)
  minutes == 0 ? 0 : MINUTES_PER_DAY - minutes
end

p after_midnight('00:00') #=> 0
p before_midnight('00:00') #=> 0
p after_midnight('12:34') #=> 754
p before_midnight('12:34') #=> 686
p after_midnight('01:29')
p before_midnight('01:29')
p before_midnight('11:26')
p before_midnight('11:59')
p before_midnight('00:01')
