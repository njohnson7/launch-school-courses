# exercise12.rb
# Given the following data structures.
# Write a program that moves the information from the array into the empty hash that applies to the correct person.

# contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
#             ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

# contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}



contact_data = [ ["joe@email.com", "123 Main St.", "555-123-4567"],
                 ["sally@email.com", "404 Not Found Dr.", "123-234-3454"] ]

contacts = { "Joe Smith" => {}, "Sally Johnson" => {} }

# FIRST SOLUTION:
# (commented out code for testing purposes):
    # contacts["Joe Smith"] = { email: contact_data[0][0], address: contact_data[0][1], phone: contact_data[0][2] }
    # contacts["Sally Johnson"] = { email: contact_data[1][0], address: contact_data[1][1], phone: contact_data[1][2] }
puts contacts



# SECOND SOLUTION:
def extract_data(arr)       # creates a method to extract email, address, and phone fields from an array and store it in a hash
  person = { email: arr[0], address: arr[1], phone: arr[2] }
end

# (commented out code for testing purposes):
    # contacts["Joe Smith"] = extract_data(contact_data[0])
    # contacts["Sally Johnson"] = extract_data(contact_data[1])
puts contacts



# THIRD SOLUTION:
index = 0       # creates an index variable to use when calling the each method on contacts, so that the right nested array gets extracted
contacts.each_key do |k|        # updates values for each person in contacts array
  contacts[k] = extract_data(contact_data[index])       # calls extract_data method for each person in contacts hash, and puts the extracted
                                                        #  data into each person's nested hash under the correct keys
  index += 1        # increments index so that the data extracted from the next index of the array will go under the next person
end

puts contacts



# BOOK SOLUTION:
# uses assignment instead of loops
contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

puts contacts