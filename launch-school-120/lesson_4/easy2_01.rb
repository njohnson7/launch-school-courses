# easy2_01.rb

# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of calling

oracle = Oracle.new
oracle.predict_the_future


# The first line, oracle = Oracle.new, will instantiate a new instance of an
#  Oracle object, and assign it to the variable oracle. It will return a new
#  Oracle object.
# The next line, oracle.predict_the_future, will call the instance method,
#  Oracle#predict_the_future, on the Oracle object referenced by oracle, which
#  will return the string, 'You will ' concatenated to one of the three strings
#  contained in the array of Strings returned by the Oracle#choices method. The
#  string that gets selected will be a random string out of all 3 strings,
#  because the predict_the_future method calls Array#sample on the return value
#  of choices.
# This code won't print out anything, only return an Oracle object and a string.
