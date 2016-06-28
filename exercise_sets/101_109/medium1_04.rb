# medium1_04.rb
# 1000 Lights

# You have a bank if switches before you numbered from 1 to 1000. Each switch is
# connected to exactly one light that is initially off. You walk down the row of
# switches, and turn every one of them on. Then, you go back to the beginning
# and toggle switches 2, 4, 6, and so on. Repeat this for switches 3, 6, 9, and
# so on, and keep going until you have been through 1000 repetitions of this
# process.

# Write a program that determines how many lights are on at the end, and which
# lights are on.

# Example with 5 lights:

#     round 1: every light is turned on
#     round 2: lights 2 and 4 are now off; 1, 3, 5 are on
#     round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
#     round 4: lignts 2 and 3 are now off; 1, 4, and 5 are on
#     round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The result is that 2 lights are left on, lights 1 and 4.

# With 10 lights, 3 lights are left on: lights 1, 4, and 9.

def join_and(ary)
  ary[-1] = 'and ' + ary.last.to_s if ary.size > 1
  ary.join(', ')
end

def switch_lights(num)
  lights = [false] * num
  1.upto(lights.size) do |round|
    lights.map!.with_index do |light, idx|
      (idx + 1) % round == 0 ? !light : light
   end
  end
  lights_on = []
  lights.each_with_index do |light, idx|
    lights_on << idx + 1 if light
  end
  puts "With #{num} lights total, there are #{lights_on.size} lights" \
       " left on: #{join_and(lights_on)}."
end

switch_lights(5)
switch_lights(10)
switch_lights(16)
switch_lights(26)
switch_lights(50)
switch_lights(101)
switch_lights(1000)
puts


# Alternate solution:
def switch_lights(num)
  square = 1
  n = 1
  lights_on = []
  while square <= num
    lights_on << square
    n += 1
    square = n * n
  end
  puts "With #{num} lights total, there are #{lights_on.size} lights" \
       " left on: #{join_and(lights_on)}."
end

switch_lights(5)
switch_lights(10)
switch_lights(16)
switch_lights(26)
switch_lights(50)
switch_lights(101)
switch_lights(1000)
puts


# Alternate solution 2:
def toggle_lights_once(lights, lights_to_toggle)
  lights.map.with_index do |light, idx|
    (idx + 1) % lights_to_toggle == 0 ? !light : light
  end
end

def display_lights_on(num, lights)
  lights_on = find_lights_on(lights)
  puts "With #{num} lights total, there are #{lights_on.size} lights" \
       " left on: #{join_and(lights_on)}."
end

def find_lights_on(lights)
  lights.each_with_index.with_object([]) do |(light, idx), lights_on|
    lights_on << idx + 1 if light
  end
end

def switch_lights(num)
  lights = [false] * num
  (1..num).each { |n| lights = toggle_lights_once(lights, n) }
  display_lights_on(num, lights)
end

switch_lights(5)
switch_lights(10)
switch_lights(16)
switch_lights(26)
switch_lights(50)
switch_lights(101)
switch_lights(1000)
puts


# Book solution:
def toggle_lights(lights)
  1.upto(lights.size) do |round|
    lights.each do |position, value|
      if position % round == 0
        value == 'off' ? lights[position] = 'on' : lights[position] = 'off'
      end
    end
  end
end

def find_lights_on(lights)
  lights.select { |position, value| value == 'on' }.keys
end

def display_lights_on(lights)
  lights_on = find_lights_on(lights)
  puts "With #{lights.size} lights total, there are #{lights_on.size} lights" \
       " left on: #{join_and(lights_on)}."
end

lights = {}
1.upto(1000) { |n| lights[n] = 'off' }
toggle_lights(lights)
find_lights_on(lights)
display_lights_on(lights)
puts


# 3. We could have a method that replicates the output from description of this
# problem(i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we
# go about making that method?

def toggle_lights_once(lights, round)
  lights.map.with_index do |light, idx|
    (idx + 1) % round == 0 ? !light : light
  end
end

def display_lights_on(lights, num)
  lights_on = find_light_status(lights)[:lights_on]
  puts "With #{num} lights total, there are #{lights_on.size} lights" \
       " left on: #{join_and(lights_on)}."
end

def find_light_status(lights)
  lights.each_with_index.with_object({ lights_on: [], lights_off: [] }) do |(light, idx), light_status|
    if light then light_status[:lights_on] += [idx + 1]
    else light_status[:lights_off] += [idx + 1]
    end
  end
end

def switch_lights(num)
  lights = [false] * num
  (1..num).each do |round|
    lights = toggle_lights_once(lights, round)
    display_current_light_status(lights, round)
  end
  display_lights_on(lights, num)
end

def display_current_light_status(lights, round)
  if round == 1
    puts 'Round 1: every light is turned on.'
  else
    puts "Round #{round}: lights #{join_and(find_light_status(lights)[:lights_off])}"\
         " are now off; #{join_and(find_light_status(lights)[:lights_on])} are on."
  end
end

switch_lights(5)
puts
switch_lights(10)
