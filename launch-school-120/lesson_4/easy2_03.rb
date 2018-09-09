# easy2_03.rb

# How do you find where Ruby will look for a method when that method is called?
# How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

p Orange.ancestors
p HotSauce.ancestors

# What is the lookup chain for Orange and HotSauce?


# You can call the Module#ancestors method on the name of the class that
#  contains the method. For instance, HotSauce.ancestors. This will return
#  an array, containing the class itself, followed by all the classes ancestors,
#  which is made up of modules and superclasses, in the order of location that
#  the method will be looked in. Ruby first searches in included Modules, in
#  reverse order of appearance in the class definition, followed by the parent
#  class, the parent class's included modules, and so on, until it reaches the
#  end of the method lookup hierarchy, which is BasicObject.
# The method lookup chain for Orange is [Orange, Taste, Object, Kernel,
#  BasicObject]
# The method lookup chain for HotSauce is [HotSauce, Taste, Object, Kernel,
#  BasicObject]
# If the method isn't found in the first class or module, Ruby will continue
#  searching for it in each subsequent class/module in the chain, and will
#  raise a NoMethodError if the method isn't found anywhere in the chain
