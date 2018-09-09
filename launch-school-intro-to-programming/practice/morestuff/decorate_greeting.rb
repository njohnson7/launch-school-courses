# decorate_greeting.rb
# Example of a longer error stack trace, in a slightly more complex program
# Pay attention to the stack trace and how it allows u to see what called which method, and provides a trail of calls



def space_out_letters(person)
  return person.split("").join(" ")
end

def greet(person)
  return "H e l l o, " + space_out_letters(person)
end

def decorate_greeting(person)
  puts "" + greet(person) + ""
end

decorate_greeting("John")       # works as expected
decorate_greeting(1)
# Raises an exception:
    # decorate_greeting.rb:8:in `space_out_letters': undefined method `split' for 1:Fixnum (NoMethodError)
    #   from decorate_greeting.rb:12:in `greet'
    #   from decorate_greeting.rb:16:in `decorate_greeting'
    #   from decorate_greeting.rb:20:in `<main>'

# Ordinarily this should pass the execution flow through as following:
    # main -> decorate_greeting -> greet -> space_out_letters (passes result back) -> greet -> decorate_greeting -> main
        # looking at the stack trace, you can see this happening:
            # On line 20 (the beginning of the chain where the error originated) the decorate_greeting method is called.
            # It then identifies line 16, where the greet method is called by decorate_greeting.
            # And then line 12, where greet calls space_out_letters.
            # Finally line 8, where the function split is used on a Fixnum
                # Because the function 'split' expects a string, we get an error, along w/ a trace of the calls that lead up to that
                #  error.