# medium1_04.rb

def splat(arr)
  yield arr
end

splat(%w[raven finch hawk eagle]) do |_, _, *birds_of_prey|
  puts "Birds of prey: #{birds_of_prey.join(', ')}"
end
