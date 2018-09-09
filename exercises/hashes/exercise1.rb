# exercise1.rb
# Given a hash of family members, with keys as the title and an array of names as the values, use ruby's built-in select method to
#  gather only immediate family members' names into a new array



# Given:
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank", "rob", "david"],
            aunts: ["mary", "sally", "susan"]
          }


family_immediate = []       # creates a new empty array called family_immediate

family.select do |key, value|        # calls select method on family hash
  if key == :sisters || key == :brothers        # selects all values under the :sisters and :brothers keys
    family_immediate << value       # adds values to family_immediate array
  end
end

family_immediate = family_immediate.flatten       # turns the nested family_immediate array into an un-nested array

p family_immediate        # prints out the result - the names of immediate family members in a single un-nested array



# Solution 2 - book solution

immediate_family = family.select do |k, v|        # creates a new hash containing only the :sisters and :brothers keys and values from family
  k == :sisters || k == :brothers
end

arr = immediate_family.values.flatten       # calls values method on immediate_family hash to return only its values as a nested array, then
                                            #  calls flatten method on it to un-nest the 2 arrays it contains, then assigns the results to a
                                            #  variable called arr

p arr       # prints arr - same output as solution 1



# BOOK NOTES:
# select method goes thru all keys-values pairs and selects ones with certain criteria
# if do |k, v| is true, then the key-value pairs will be returned in a new hash