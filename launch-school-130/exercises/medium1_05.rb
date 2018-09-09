# medium1_05.rb

items = %w[apples corn cabbage wheat]

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end


# 1)
gather(items) { |*first, last| puts first.join(', '), last } # 1)

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
puts



# 2)
gather(items) { |first, *middle, last| puts first, middle.join(', '), last }

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!
puts



# 3)
gather(items) { |first, *last| puts first, last.join(', ') }

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!
puts




# 4)
gather(items) { |a, b, c, d| puts "#{[a, b, c].join(', ')}, and #{d}" }

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!




gather(items) { |*first, last| puts first.join(', '), last } # 1
gather(items) { |first, *middle, last| puts first, middle.join(', '), last } # 2
gather(items) { |first, *last| puts first, last.join(', ') } # 3
gather(items) { |a, b, c, d| puts "#{[a, b, c].join(', ')}, and #{d}" } # 4
