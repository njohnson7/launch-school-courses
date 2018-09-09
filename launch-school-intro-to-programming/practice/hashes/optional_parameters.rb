# optional_parameters.rb



def greeting(name, options = {})        # default parameter for options is an empty hash
  if options.empty?
    puts "Hi, my name is #{name}."        # only prints name if options hash is empty
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" + " years old and I live in #{options[:city]}."
  end
end

greeting("Bob")
greeting("Bob", {age: 62, city: "New York City"})

# also can pass in arguments to the greeting method like this:
greeting("Bob", age: 62, city: "New York City", test: "test")
# curly braces {} are not required when a hash is the last argument.
# output is the same.
# commonly used convention in Rails.