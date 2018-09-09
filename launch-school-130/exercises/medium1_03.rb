# medium1_03.rb

def gather(items)
  puts "Let's start gathering food."
  # items.each { |item| yield(item) }
  yield(items)
  puts "Let's stop gathering food."
end

items = %w[apples corn cabbage wheat]

# gather(items) { |item| puts "Gathered a #{item}!" }
gather(items) { |produce| puts produce.join('; ') }
puts

gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end
