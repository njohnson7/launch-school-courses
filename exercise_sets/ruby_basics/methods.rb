# methods.rb


# 1. Greeting Through Methods (Part 1)
def hello
  'Hello'
end

def world
  'World'
end

puts "#{hello} #{world}"
puts



# 2. Greeting Through Methods (Part 2)
def greet
  "#{hello} #{world}"
end

puts greet
puts



# 3. Make and Model
def car(make, model)
  "#{make} #{model}"
end

puts car('Toyota', 'Corolla')
puts



# 4. Day or Night?
daylight = [true, false].sample

def time_of_day(daylight)
  puts daylight ? "It's daytime!" : "It's nighttime!"
end

time_of_day(daylight)
puts



# 5. Naming Animals
def dog(name)
  name
end

def cat(name = 'Ginger')
  name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat}."
puts



# 6. Name Not Found
def assign_name(name = 'Bob')
  name
end

puts assign_name == 'Bob'
puts assign_name('Kevin') == 'Kevin'
puts



# 7. Multiply the Sum
def add(n1, n2)
  n1 + n2
end

def multiply(n1, n2)
  n1 * n2
end


puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
puts



# 8. Random Sentence
def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end

def sentence(name, activity)
  "#{name} went #{activity} today!"
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']
puts sentence(name(names), activity(activities))
puts



# 9. Print Me (Part 1)
def print_me
  puts "I'm printing within the method!"
end

print_me
puts



# 10. Print Me (Part 2)
def print_me
  "I'm printing the return value!"
end

puts print_me
puts
