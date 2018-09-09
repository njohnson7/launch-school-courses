# exercise1.rb
# Program that prints a greeting message
# Contains a method called greeting that takes a name as its parameter, and returns a string



def greeting(name)        # creates a method called greeting that takes the variable name as its parameter
  "Hello #{name}."       # returns a greeting message including the name, as a string
end

puts "Please enter your name."        # prompts user for their name
name_input = gets.chomp       # stores user input string in variable called name_input and removes '\n' character by calling chmp
puts greeting(name_input)       # calls the greeting method with the name_input variable as a parameter
                                # and outputs its return value


# Solution 2: using methods as arguments

def gets_name(name_input2 = gets.chomp)       # creates a method that accepts user name input
  name_input2
end

def greeting2(name2)        # creates a method that outputs a greeting message with a name and returns it
  puts "Hello #{name2}."
  name2
end

puts "\nWhat is your name?"       # prompts user for name
greeting2(gets_name())        # stores user's name and prints it out in a string using method nesting


# Solution 3: using a third method for prompting the user for their name

puts "\n"

def name_prompt(prompt = "What is your name?")        # creates method to prompt user for name
  prompt
end

puts name_prompt        # calls the name_prompt method and prints its return value to screen
greeting2(gets_name)        # see above



# Solution 4: practice using the solution shown in book

puts "\n"

def greeting4 (name)        # define a method that takes a parameter name
  "Hello, " + name + ". How are you doing?"       # returns greeting string using string concatenation instead of interpolation
end

puts greeting4("Bob")       # prints string returned in greeting4 method passing in the name Bob