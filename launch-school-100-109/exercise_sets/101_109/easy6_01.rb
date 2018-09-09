# easy6_01.rb
# Cute Angles

# Write a method that takes a floating point number that represents an angle
#  between 0 and 360 degrees and returns a String that represents that angle in
#  degrees, minutes, and seconds. You should use a degree symbol (˚) to represent
#  degrees, a single quote (') to represent minutes, and a double quote (") to
#  represent seconds. There are 60 minutes in a degree, and 60 seconds in a
#  minute.

def dms(float)
  degrees, remainder = float.divmod(1)
  minutes, remainder = (remainder * 60).divmod(1)
  seconds = remainder * 60

  degrees, minutes, seconds = [degrees, minutes, seconds].map(&:round)

  degrees = 0 if degrees == 360
  if minutes == 60
    degrees += 1
    minutes = 0
  end
  if seconds == 60
    minutes += 1
    seconds = 0
  end

  format(%(%d°%02d'%02d"), degrees, minutes, seconds)
end

puts dms(30) #=> %(30°00'00")
puts dms(76.73) #=> %(76°43'48")
puts dms(254.6) #=> %(254°36'00")
puts dms(93.034773) #=> %(93°02'05")
puts dms(0) #=> %(0°00'00")
puts dms(360) #=> %(360°00'00") || dms(360) == %(0°00'00")
puts dms(1.6523)
puts dms(568)
puts dms(756.429)
puts dms(-76.73)
puts


# Book solution:
DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(30) #=> %(30°00'00")
puts dms(76.73) #=> %(76°43'48")
puts dms(254.6) #=> %(254°36'00")
puts dms(93.034773) #=> %(93°02'05")
puts dms(0) #=> %(0°00'00")
puts dms(360) #=> %(360°00'00") || dms(360) == %(0°00'00")
puts dms(1.6523)
puts dms(568)
puts dms(756.429)
puts


# While our solution works with the expanded range of non-negative numbers, it
#  fails with negative numbers. For instance, dms(-76.73) returns -77°16'12",
#  which is incorrect. Modify our solution so it works with negative values as
#  well as non-negative values.

def dms(float)
  total_seconds = (float.abs * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  degrees = -degrees if float.negative?

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end


puts dms(30) #=> %(30°00'00")
puts dms(76.73) #=> %(76°43'48")
puts dms(254.6) #=> %(254°36'00")
puts dms(93.034773) #=> %(93°02'05")
puts dms(0) #=> %(0°00'00")
puts dms(360) #=> %(360°00'00") || dms(360) == %(0°00'00")
puts dms(1.6523)
puts dms(568)
puts dms(756.429)
puts

puts dms(-30)
puts dms(-76.73)
puts dms(-254.6)
puts dms(-93.034773) #=> -93° 2' 5"
puts dms(-0)
puts dms(-360)
puts dms(-1.6523)
puts dms(-568)
puts dms(-756.429) #=> -756° 25' 44"
puts dms(+756.429)
puts dms(+5)
puts dms(+432)
puts dms(+23.634324234)
