# easy2_06.rb
# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

youngest = ages.values.inject do |memo, age|
  memo < age ? memo : age
end
puts youngest

youngest2 = ages.inject(ages.values.max) do |(memo), (_, age)|
  memo < age ? memo : age
end
puts youngest2

puts ages.values.min

puts [ages.min_by { |_, age| age }].to_h

puts ages.select { |_, age| age == ages.values.min }

puts Hash[*ages.sort_by(&:last)[0]]
