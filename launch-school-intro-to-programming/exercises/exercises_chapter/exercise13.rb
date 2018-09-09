# exercise13.rb
# Using the hash you created from the previous exercise, demonstrate how you would access Joe's email and Sally's phone number.



# hash from previous exercise:
contacts = { "Joe Smith" => { :email => "joe@email.com", :address => "123 Main St.", :phone => "555-123-4567"},
             "Sally Johnson" => { :email => "sally@email.com", :address => "404 Not Found Dr.", :phone => "123-234-3454"} }

puts contacts["Joe Smith"][:email]        # prints Joe's email
puts contacts["Sally Johnson"][:phone]        # prints Sally's phone number



# BOOK SOLUTION:
puts "Joe's email is #{contacts['Joe Smith'][:email]}"
puts "Sally's phone number is: #{contacts['Sally Johnson'][:phone]}"