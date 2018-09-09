# easy3_4.rb
# Shorten this sentence:
# ...remove everything starting from "house".

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!("Few things in life are as important as ")
p advice


advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0..38)
p advice


advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0..(advice =~ /house/) - 1)
p advice


advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(/^.*as/)
p advice


advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0, advice.index('house'))
p advice


# If you use the .slice method instead of .slice!, it will still return the same
# value, but the original advice string won't be modified:
advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice("Few things in life are as important as ")
p advice
