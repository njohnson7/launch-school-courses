# easy2_02.rb
# Add up all of the ages from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

ages_sum = 0

ages.each_value { |age| ages_sum += age }

puts ages_sum

puts ages.inject(0) { |sum, (_, age)| sum + age }

puts ages.values.reduce(:+)

ages.each_with_object(0) { |sum, (_, age)| sum += age }
ages.values.each_with_object(0) { |age, sum| sum += age }
