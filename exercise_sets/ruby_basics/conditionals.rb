# conditionals.rb


# 1. Unpredictable Weather (Part 1)
def bright
  sun = ['visible', 'hidden'].sample
  puts "The sun is so bright!" if sun == 'visible'
end

bright
puts



# 2. Unpredictable Weather (Part 2)
def clouds
  sun = ['visible', 'hidden'].sample
  puts "The clouds are blocking the sun!" unless sun == 'visible'
end

clouds
puts



# 3. Unpredictable Weather (Part 3)
def bright_clouds
  sun = ['visible', 'hidden'].sample
  puts sun == 'visible' ? "The sun is so bright!" : "The clouds are blocking the sun!"
end

bright_clouds
puts



# 4. True or False
def true_false
  boolean = [true, false].sample
  puts boolean ? "I'm true!" : "I'm false!"
end

true_false

# Alternate solution:
def true_false
  boolean = [true, false].sample
  puts "I'm #{boolean}!"
end

true_false

# Alternate solution 2:
def true_false
  boolean = [true, false].sample
  puts "I'm #{boolean ? 'true' : 'false'}!"
end

true_false
puts



# 6. Stoplight (Part 1)
def stop_light
  stoplight = ['green', 'yellow', 'red'].sample
  puts case stoplight
       when 'green' then 'Go!'
       when 'yellow' then 'Slow down!'
       else 'Stop!'
       end
end

stop_light
puts



# 7. Stoplight (Part 2)
def stop_light
  stoplight = ['green', 'yellow', 'red'].sample
  if stoplight == 'green' then puts 'Go!'
  elsif stoplight == 'green' then puts 'Slow down!'
  else puts 'Stop!'
  end
end

stop_light
puts



# 8. Sleep Alert
def sleep_alert
  status = ['awake', 'tired'].sample
  output = status == 'awake' ? 'Be productive!' : 'Go to sleep!'
  puts output
end

sleep_alert
puts



# 9. Cool Numbers
def cool_numbers
  number = rand(10)
  puts number == 5 ? '5 is a cool number!' : 'Other numbers are cool too!'
end

cool_numbers
puts



# 10. Stoplight (Part 3)
def stop_light
  stoplight = ['green', 'yellow', 'red'].sample
  puts case stoplight
       when 'green'  then 'Go!'
       when 'yellow' then 'Slow down!'
       else               'Stop!'
       end
end

stop_light
