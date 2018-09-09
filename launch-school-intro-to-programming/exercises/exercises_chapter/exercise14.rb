# exercise14.rb
# Programmatically loop or iterate over the contacts hash from exercise 12, and populate the associated data from the contact_data array.
# Hint: you will probably need to iterate over ([:email, :address, :phone]), and some helpful methods might be Array shift and first methods.



contact_data = [ ["joe@email.com", "123 Main St.", "555-123-4567"],
                 ["sally@email.com", "404 Not Found Dr.", "123-234-3454"],
                 ["bob@email.com", "24 Fake st.", "222-333-4444"] ]

contacts = { "Joe Smith" => {}, "Sally Johnson" => {}, "Bob Loblaw" => {} }



# Pretty much same code as in solution 3 of exercise 12, but used the shift method instead of indexes to extract data.

def extract_data(arr)
  person = { email: arr.shift, address: arr.shift, phone: arr.shift }       # uses shift method to collect three data fields from array
                                                                            #  and adds them to person hash under associated keys
end

index = 0
contacts.each_key do |k|
  contacts[k] = extract_data(contact_data[index])
  index += 1
end

puts contacts



# BOOK SOLUTION:

contact_data2 = ["joe@email.com", "123 Main St.", "555-123-4567"]
contacts2 = { "Joe Smith" => {} }

fields = [:email, :address, :phone]       # creates an array called fields, with email, address, and phone as symbols

contacts2.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_data2.shift       # hash var represents the hash, and field represents the field
                                            # shift method removes and returns the first element (string)
  end
end

puts contacts2



# BOOK SOLUTION 2 - multiple entries in contacts hash:

contact_data2 = [ ["joe@email.com", "123 Main St.", "555-123-4567"],
                 ["sally@email.com", "404 Not Found Dr.", "123-234-3454"],
                 ["bob@email.com", "24 Fake st.", "222-333-4444"] ]

contacts2 = { "Joe Smith" => {}, "Sally Johnson" => {}, "Bob Loblaw" => {} }

fields = [:email, :address, :phone]

contacts2.each_with_index do |(name, hash), idx|        # uses each_with_index so it can extract from nested arrays to nested keys
  fields.each do |field|
    hash[field] = contact_data2[idx].shift        # uses index of hash to go over the corresponding index in contact_data2
  end
end

puts contacts2



# VIDEO NOTES:
# use loops instead of assignment to do the same as in exercise 12.

# iterate through the contacts with key value pairs.
# Sequence of fields array matches the sequence of the data, so we can iterate over the fields and then match each field element with an
#  element in the contact data.