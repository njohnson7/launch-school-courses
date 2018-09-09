# easy2_02.rb

# We have an Oracle class and a RoadTrip class that inherits from the Oracle
# class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future


# The result is similar to that in the previous question, except that the
#  choices method in RoadTrip, which is a subclass of Oracle, will override
#  the choices instance method in Oracle, so one of the 3 strings in the array
#  returned by Roadtrip#choices will be returned by Array#sample, instead of
#  one of the 3 strings in Oracle#choices. Because RoadTrip is a child of Oracle,
#  trip, an instance of the RoadTrip class, will still be able to be the
#  receiver of the predict_the_future method, as subclasses inherit all the
#  instance methods of their base class. The method lookup path in Ruby starts
#  with the class itself, then any included modules, then the parent class, and
#  so on, so the RoadTrip#choices method has priority over the Oracle#choices
#  method. We can see the method lookup call order by calling Module#ancestors
#  on the class, which will return an array of all the classes and modules that
#  Ruby will look for a method called on an instance of the class in, in order
#  of precedence.

# Every time Ruby tries to resolve a method name, it will start with the methods
#  defined on the class you're calling.
