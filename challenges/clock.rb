# Create a clock that is independent of date.

# You should be able to add and subtract minutes to it. Two clocks that
# represent the same time should be equal to each other.


# class Clock
#   attr_reader :mins

#   def self.at(hour, min = 0)
#     new(hour, min)
#   end

#   def initialize(hour, min)
#     @mins = (min + hour * 60) % 1440
#   end

#   def +(min)
#     Clock.new(0, mins + min)
#   end

#   def -(min)
#     self.+(-min)
#   end

#   def ==(other)
#     mins == other.mins
#   end

#   def to_s
#     format('%02d:%02d', *mins.divmod(60))
#   end
# end



# class Clock
#   attr_reader :mins

#   # def self.at(hour, min = 0)
#   #   new(hour, min)
#   # end

#   class << self
#     alias_method :at, :new
#   end

#   class << self
#     alias at new
#   end

#   singleton_class.send(:alias_method, :at, :new)

#   def initialize(hour, min = 0)
#     @mins = (min + hour * 60) % 1440
#   end

#   def +(min)
#     Clock.new(0, mins + min)
#   end

#   def -(min)
#     self.+(-min)
#   end

#   def ==(other)
#     mins == other.mins
#   end

#   def to_s
#     format('%02d:%02d', *mins.divmod(60))
#   end
# end




# Clock = Struct.new(:mins) do
#   define_singleton_method(:at) { |hour, min = 0| new(hour, min) }
#   define_method(:initialize)   { |hour, min| self.mins = (min + hour * 60) % 1440 }
#   define_method(:==)           { |other| mins == other.mins }
#   define_method(:to_s)         { format('%02d:%02d', *mins.divmod(60)) }
#   %i[+ -].each { |op| define_method(op) { |min| Clock.new(0, mins.send(op, min)) } }
# end


Clock = Struct.new(:mins) do
  singleton_class.send(:alias_method, :at, :new)
  define_method(:initialize) { |hour, min = 0| self.mins = (min + hour * 60) % 1440 }
  define_method(:==)         { |other| mins == other.mins }
  define_method(:to_s)       { format('%02d:%02d', *mins.divmod(60)) }
  %i[+ -].each { |op| define_method(op) { |min| Clock.new(0, mins.send(op, min)) } }
end
