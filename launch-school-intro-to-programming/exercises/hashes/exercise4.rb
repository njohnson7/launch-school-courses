# exercise4.rb
# Given the following expression, how would you access the name of the person?



# Given:
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}



# Accessing name of the person by calling :name key
puts "The person's name is #{person[:name]}."


# or by calling the fetch method and passing it the :name key
puts person.fetch(:name)


# or by calling the values method which returns the values of person in an array, then using [0] to select the first element
puts person.values[0]


# or by calling the select method and using an if statement to put the value when the key is equal to :name
person.select do |k, v|
  if k == :name
    puts v
  end
end