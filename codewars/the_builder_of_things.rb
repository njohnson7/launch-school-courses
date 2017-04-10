require 'active_support'
require 'active_support/core_ext/string'
require_relative 'framework'


# imported to handle any plural/singular conversions

# class Thing
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#     @last_called = nil
#   end

#   def is_a
#     @last_called = :is_a
#     self
#   end

#   def is_not_a
#     @last_called = :is_not_a
#     self
#   end

#   def is_the
#     @last_called = :is_the
#     self
#   end

#   def joe
#     @last_called = :joe
#     self
#   end

#   def test
#     "#{}"
#       ;require'pry';binding.pry;
#     self
#   end



#   def method_missing(meth_id)
#     if %w[is_a is_not_a].include?(@last_called.to_s)
#       result = @last_called.to_s == 'is_a'
#       define_singleton_method("#{meth_id}?") { result }
#     end

#     if @last_called.to_s == 'is_the'
#       self
#     end

#     if @last_called.to_s =~ /_of\z/
#   ;require'pry';binding.pry;
#       @last_called = @last_called.to_s
#       self
#     end

#     if @last_called.to_s == 'joe'
#       'asd'
#       self
#     end

#   end
# end

# class Proc
#     def call_with_obj(obj, *args)
#         m = nil
#         p = self
#         Object.class_eval do
#             define_method :a_temp_method_name, &p
#             m = instance_method :a_temp_method_name; remove_method :a_temp_method_name
#         end
#         m.bind(obj).call(*args)
#     end
# end

# class Thing
#   attr_reader :name

#   def initialize(name = nil)
#     @name = name
#   end

#   def is_a
#     @last_called = 'is_a'
#     self
#   end

#   def is_not_a
#     @last_called = 'is_not_a'
#     self
#   end

#   def is_the
#     @last_called = 'is_the'
#     self
#   end

#   def has(num)
#     @last_called = 'has'
#     @amount = num
#     self
#   end

#   alias having has
#   alias with has

#   def being_the
#     @last_called = 'being_the'
#     self
#   end

#   def can
#     @last_called = 'can'
#     self
#   end

#   # def singleton_method_added(method_name)
#   #   if @past_tense
#   #     define_singleton_method("#{@past_tense}") do

#   #     end
#   #   end
#   # end

#   def method_missing(method_name, *args, &block)
#     case
#     when @last_called == 'is_a'
#       define_singleton_method("#{method_name}?") { true }
#     when @last_called == 'is_not_a'
#       define_singleton_method("#{method_name}?") { false }
#     when @last_called == 'is_the'
#       @before_last_called = @last_called
#       @last_called = method_name.to_s
#       self
#     when @last_called =~ /(.*_of)\z/
#       if @before_last_called == 'is_the'
#         define_singleton_method($1) { method_name.to_s }
#       end
#     when @last_called == 'has'
#       if @amount == 1
#         instance_variable_set("@#{method_name}", Thing.new(method_name))
#       else
#         instance_variable_set("@#{method_name}", Things.new(method_name, @amount))
#       end
#       singleton_class.send(:attr_reader, "#{method_name}")
#       send(method_name)
#     when @last_called == 'being_the'
#       @before_last_called = @last_called
#       @last_called = method_name.to_s
#       self
#     when @before_last_called == 'being_the'
#       instance_variable_set("@#{@last_called}", method_name.to_s)
#       self
#     when @last_called == 'can'
#       # @method_added = true unless args.empty?
#       # @past_tense = args.first unless args.empty?
#       # define_singleton_method("#{method_name}_orig", block)
#       # define_singleton_method("#{method_name}", block)
#       # @past_tense = nil
#         # ;require'pry';binding.pry;
#       define_singleton_method("can_#{method_name}", block)
#       unless args.empty?
#         instance_variable_set("@#{method_name}", [])
#         define_singleton_method("#{args.first}") do
#           instance_variable_get("@#{method_name}")
#         end
#       end
#       @last_called = nil

#     # when methods(false).map(&:to_s).include?()
#     when (matching = methods(false).map(&:to_s).find { |m| m[/can_#{method_name}/] })
#         # ;require'pry';binding.pry;
#       result = send(matching, *args)
#       instance_variable_get("@#{method_name}") << result
#       result
#     end
#   end
# end

# class Things
#   def initialize(name, amount)
#     @things = Array.new(amount) { Thing.new(name) }
#   end

#   def size
#     @things.size
#   end

#   def first
#     @things.first
#   end

#   def each
#     @things.each { |thing| thing.instance_eval(&proc) }
#   end
# end



# class Thing
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#     define_singleton_method("#{name}?") { true }
#   end

#   def is_a
#     @last_called = 'is_a'
#     self
#   end

#   def is_not_a
#     @last_called = 'is_not_a'
#     self
#   end

#   def is_the
#     @last_called = 'is_the'
#     self
#   end

#   def has(num)
#     @last_called = 'has'
#     @amount = num
#     self
#   end

#   alias having has
#   alias with has

#   def being_the
#     @last_called = 'being_the'
#     self
#   end

#   alias and_the being_the

#   # def and_the
#   #   @last_called = 'and_the'
#   #     ;require'pry';binding.pry;
#   #   self
#   # end

#   def can
#     @last_called = 'can'
#     self
#   end

#   def method_missing(method_name, *args, &block)
#     case
#     when @last_called == 'is_a'
#       define_singleton_method("#{method_name}?") { true }
#     when @last_called == 'is_not_a'
#       define_singleton_method("#{method_name}?") { false }
#     when @last_called == 'is_the'
#       @before_last_called = @last_called
#       @last_called = method_name.to_s
#       self
#     when @last_called =~ /(.*_of)\z/
#       if @before_last_called == 'is_the'
#         define_singleton_method($1) { method_name.to_s }
#       end
#     when @last_called == 'has'
#       if @amount == 1
#         # instance_variable_set("@#{method_name}", Thing.new(method_name.to_s[/\A(.*)s?\z/, 1]))
#         instance_variable_set("@#{method_name}", Thing.new(method_name.to_s))
#       else
#         instance_variable_set("@#{method_name}", Things.new(method_name.to_s[/\A(.*)s\z/, 1], @amount))
#       end
#       # if method_name.to_s =~ /eye/
#         # ;require'pry';binding.pry;
#       # end
#       singleton_class.send(:attr_reader, "#{method_name}")
#       send(method_name)
#     when @last_called == 'being_the'
#       @before_last_called = @last_called
#       @last_called = method_name.to_s
#       self
#     when @before_last_called == 'being_the'
#       instance_variable_set("@#{@last_called}", method_name.to_s)
#       singleton_class.send(:attr_reader, "#{@last_called}")
#       self
#     # when @last_called == 'and_the'
#     #   @before_last_called = @last_called
#     #   @last_called = method_name.to_s
#     # when @before_last_called == 'and_the'
#       # p instance_variable_get("#{instance_variables.last}")

#     when @last_called == 'can'
#       define_singleton_method("can_#{method_name}", block)
#       unless args.empty?
#         instance_variable_set("@#{method_name}", [])
#         define_singleton_method("#{args.first}") do
#           instance_variable_get("@#{method_name}")
#         end
#       end
#       @last_called = nil
#     when (matching = methods(false).map(&:to_s).find { |m| m[/can_#{method_name}/] })
#         # ;require'pry';binding.pry;
#       result = send(matching, *args)
#       instance_variable_get("@#{method_name}")&.<< result
#       result
#     end
#   end
# end

# class Things #< Array
#   # attr_reader :things

#   def initialize(name, amount)
#     # if name =~ /eye/
#     #     ;require'pry';binding.pry;
#     # end
#     @things = Array.new(amount) { Thing.new(name) }
#   end

#   def is_a?(klass)
#     klass == Array
#   end

#   def size
#     @things.size
#   end

#   def first
#     @things.first
#   end

#   def last
#     @things.last
#   end

#   def each
#     @things.each { |thing| thing.instance_eval(&proc) }
#   end

#   def all?
#     @things.all?(&proc)
#   end
# end













class Thing
  attr_reader :name

  def initialize(name)
    @name = name.to_s
    define_singleton_method("#{name}?") { true }
  end

  def is_a
    @last_called = 'is_a'
    self
  end

  def is_not_a
    @last_called = 'is_not_a'
    self
  end

  def is_the
    @last_called = 'is_the'
    self
  end

  def has(num)
    @last_called = 'has'
    @amount = num
    self
  end

  alias having has
  alias with has

  def being_the
    @last_called = 'being_the'
    self
  end

  alias and_the being_the

  def can
    @last_called = 'can'
    self
  end

  def method_missing(method_name, *args, &block)
    case
    when @last_called == 'is_a'
      define_singleton_method("#{method_name}?") { true }
    when @last_called == 'is_not_a'
      define_singleton_method("#{method_name}?") { false }
    when @last_called == 'is_the'
      @before_last_called = @last_called
      @last_called = method_name.to_s
      self
    when @last_called =~ /(.*_of)\z/
      if @before_last_called == 'is_the'
        define_singleton_method($1) { method_name.to_s }
      end
    when @last_called == 'has'
      if @amount == 1
        instance_variable_set("@#{method_name}", Thing.new(method_name.to_s))
      else
        instance_variable_set("@#{method_name}", Things.new(method_name.to_s[/\A(.*)s\z/, 1], @amount))
      end
      singleton_class.send(:attr_reader, "#{method_name}")
      send(method_name)
    when @last_called == 'being_the'
      @before_last_called = @last_called
      @last_called = method_name.to_s
      self
    when @before_last_called == 'being_the'
      instance_variable_set("@#{@last_called}", method_name.to_s)
      singleton_class.send(:attr_reader, "#{@last_called}")
      self
    when @last_called == 'can'
      define_singleton_method("can_#{method_name}", block)
      unless args.empty?
        instance_variable_set("@#{method_name}", [])
        define_singleton_method("#{args.first}") do
          instance_variable_get("@#{method_name}")
        end
      end
      @last_called = nil
    when (matching = methods(false).map(&:to_s).find { |m| m[/can_#{method_name}/] })
        # ;require'pry';binding.pry;
      result = send(matching, *args)
      instance_variable_get("@#{method_name}")&.<< result
      result
    end
  end
end

class Things
  def initialize(name, amount)
    @things = Array.new(amount) { Thing.new(name) }
  end

  def is_a?(klass)
    klass == Array
  end

  def size
    @things.size
  end

  def first
    @things.first
  end

  def last
    @things.last
  end

  def each
    @things.each { |thing| thing.instance_eval(&proc) }
  end

  def all?
    @things.all?(&proc)
  end
end












# jane = Thing.new('Jane')
# p jane.name == 'Jane'

# # can define boolean methods on an instance
# jane.is_a.person
# jane.is_a.woman
# jane.is_not_a.man

# p jane.person? == true
# p jane.man? == false
# p jane.woman? == true

# # # can define properties on a per instance level
# jane.is_the.parent_of.joe
# p jane.parent_of == 'joe'

# # # can define number of child things
# # # when more than 1, an array is created
# jane.has(2).legs
# p jane.legs.size == 2
# p jane.legs.first.is_a?(Thing) == true

# # # can define single items
# jane.has(1).head
# p jane.head.is_a?(Thing) == true

# # # can define number of things in a chainable and natural format
# jane.has(2).arms.each { having(1).hand.having(5).fingers }
# p jane.arms.first.hand.fingers.size == 5

# # # can define properties on nested items
# # p jane.has(1).head.having(2).eyes.each { p self }
# jane.has(1).head.having(2).eyes.each do
#   being_the.color.blue.with(1).pupil.being_the.color.black
# end
# puts '----'
# puts

# # # can define methods
# jane.can.speak('spoke') do |phrase|
#   "#{name} says: #{phrase}"
# end

# p jane.speak("hello") #== "Jane says: hello"

# # # if past tense was provided then method calls are tracked
# p jane.spoke # => ["Jane says: hello"]





@jane = Thing.new('Jane')

  # describe 'jane = Thing.new("Jane")' do
  #   describe 'jane.name' do
  #     it 'should be "Jane"' do
p @jane.name == 'Jane'

  # describe '#is_a' do
  #   describe 'is_a.woman (dynamic key)' do
@jane.is_a.woman
      # it 'jane.woman? should return true' do
p @jane.woman? == true

  # describe '#is_not_a' do
  #   describe 'is_not_a.man (dynamic key)' do
@jane.is_not_a.man
      # it 'jane.man? should return false' do
p @jane.man? == false

  # describe '#has' do
  #   describe 'jane.has(2).arms' do
  #     before do
@jane = Thing.new('Jane')
@jane.has(2).arms
      # it 'should define an arms method that is an array' do
p @jane.arms.is_a?(Array) == true

      # it 'should populate 2 new Thing instances within the array' do
p @jane.arms.size == 2
p @jane.arms.all? { |v| v.is_a? Thing } == true

      # it 'should call each thing by its singular form (aka "arm")' do
p @jane.arms.first.name == "arm"

      # it 'should have arm? == true for each arm instance' do
p @jane.arms.first.arm? == true

    # describe 'jane.having(2).arms (alias)' do
      # it 'should populate 2 new Thing instances within the array' do
@jane = Thing.new('Jane')
@jane.having(2).arms
p @jane.arms.size == 2
p @jane.arms.all? {|v| v.is_a? Thing} == true

    # describe 'jane.has(1).head' do
      # before do
@jane = Thing.new('Jane')
@jane.has(1).head

      # it 'should define head method that is a reference to a new Thing' do
p @jane.head.is_a?(Thing) == true

#       it 'should name the head thing "head"' do
puts '______'
p @jane.head.name == "head"

#     describe 'jane.has(1).head.having(2).eyes' do
#       before do
@jane = Thing.new('Jane')
@jane.has(1).head.having(2).eyes

#       it 'should create 2 new things on the head' do
p @jane.head.eyes.size == 2
p @jane.head.eyes.first.is_a?(Thing) == true

#       it 'should name the eye things "eye"' do
p @jane.head.eyes.first.name == 'eye'

#   describe '#each' do
#     describe 'jane.has(2).arms.each { having(5).fingers }' do
#       before do
@jane = Thing.new('Jane')
@jane.has(2).arms.each { having(5).fingers }
puts '--------'

#       it 'should cause 2 arms to be created each with 5 fingers' do
p @jane.arms.first.fingers.size == 5
p @jane.arms.last.fingers.size == 5

#   describe '#is_the' do
#     describe 'jane.is_the.parent_of.joe' do
#       before do
@jane = Thing.new('Jane')
@jane.is_the.parent_of.joe

#       it 'should set jane.parent_of == "joe"' do
p @jane.parent_of == 'joe'

#     describe 'ensure dynamic usages' do
#       it 'should set any name and value (jane.is_the.???.????)' do
@jane.is_the.mother_of.kate
p @jane.mother_of == 'kate'

@jane.is_the.master_of.karate
p @jane.master_of == 'karate'
puts '********'

#   describe '#being_the' do
#     describe 'jane.has(1).head.having(2).eyes.each { being_the.color.blue }' do
#       it "jane's eyes should both be blue" do
@jane = Thing.new('Jane')
@jane.has(1).head.having(2).eyes.each { being_the.color.blue }
p @jane.head.eyes.all? {|e| e.color == 'blue'} == true

#     describe 'jane.has(2).eyes.each { being_the.color.blue.and_the.shape.round }' do
#       it 'should allow chaining via the and_the method' do
@jane = Thing.new('Jane')
@jane.has(2).eyes.each { being_the.color.blue.and_the.shape.round }
# p @jane
# p @jane.instance_variables
p @jane.eyes.first.color == 'blue'
p @jane.eyes.first.shape == 'round'

#     describe 'jane.has(2).eyes.each { being_the.color.green.having(1).pupil.being_the.color.black }' do
#       it 'should allow nesting by using having' do
@jane = Thing.new('Jane')
@jane.has(2).eyes.each { being_the.color.green.having(1).pupil.being_the.color.black }
p @jane.eyes.first.color == 'green'
p @jane.eyes.first.pupil.color == 'black'

#   describe '#can' do
#     describe 'jane.can.speak {|phrase| "#{name} says: #{phrase}"}' do
#       before do
@jane = Thing.new('Jane')
@jane.can.speak do |phrase|
  "#{name} says: #{phrase}"
end

# #       it 'should create a speak method on the instance' do
p @jane.speak('hi') == "Jane says: hi"

#     # describe 'jane.can.speak("spoke") {|phrase| "#{name} says: #{phrase}"}' do
# #       before do
@jane = Thing.new('Jane')
@jane.can.speak('spoke') do |phrase|
  "#{name} says: #{phrase}"
end

p @jane.speak('hi') == "Jane says: hi"

# #       it 'should add a "spoke" attribute that tracks all speak call results' do
p @jane.spoke == ["Jane says: hi"]
p @jane.speak('goodbye') == "Jane says: goodbye"
p @jane.spoke == ["Jane says: hi", "Jane says: goodbye"]











# describe Thing do
#   @jane = Thing.new('Jane')

#   describe 'jane = Thing.new("Jane")' do
#     describe 'jane.name' do
#       it 'should be "Jane"' do
#         Test.assert_equals(@jane.name, 'Jane')
#       end
#     end
#   end

#   describe '#is_a' do
#     describe 'is_a.woman (dynamic key)' do
#       before { @jane.is_a.woman }
#       it 'jane.woman? should return true' do
#         Test.assert_equals(@jane.woman?, true)
#       end
#     end
#   end

#   describe '#is_not_a' do
#     describe 'is_not_a.man (dynamic key)' do
#       before { @jane.is_not_a.man }
#       it 'jane.man? should return false' do
#         Test.assert_equals(@jane.man?, false)
#       end
#     end
#   end

#   describe '#has' do
#     describe 'jane.has(2).arms' do
#       before do
#         @jane = Thing.new('Jane')
#         @jane.has(2).arms
#       end

#       it 'should define an arms method that is an array' do
#         Test.assert_equals(@jane.arms.is_a?(Array), true)
#       end

#       it 'should populate 2 new Thing instances within the array' do
#         Test.assert_equals(@jane.arms.size, 2)
#         Test.assert_equals(@jane.arms.all? {|v| v.is_a? Thing}, true)
#       end

#       it 'should call each thing by its singular form (aka "arm")' do
#         Test.assert_equals(@jane.arms.first.name, "arm")
#       end

#       it 'should have arm? == true for each arm instance' do
#         Test.assert_equals(@jane.arms.first.arm?, true)
#       end
#     end

#     describe 'jane.having(2).arms (alias)' do
#       it 'should populate 2 new Thing instances within the array' do
#         @jane = Thing.new('Jane')
#         @jane.having(2).arms
#         Test.assert_equals(@jane.arms.size, 2)
#         Test.assert_equals(@jane.arms.all? {|v| v.is_a? Thing}, true)
#       end
#     end

#     describe 'jane.has(1).head' do
#       before do
#         @jane = Thing.new('Jane')
#         @jane.has(1).head
#       end

#       it 'should define head method that is a reference to a new Thing' do
#         Test.assert_equals(@jane.head.is_a?(Thing), true)
#       end

#       it 'should name the head thing "head"' do
#         Test.assert_equals(@jane.head.name, "head")
#       end
#     end

#     describe 'jane.has(1).head.having(2).eyes' do
#       before do
#         @jane = Thing.new('Jane')
#         @jane.has(1).head.having(2).eyes
#       end

#       it 'should create 2 new things on the head' do
#         Test.assert_equals(@jane.head.eyes.size, 2)
#         Test.assert_equals(@jane.head.eyes.first.is_a?(Thing), true)
#       end

#       it 'should name the eye things "eye"' do
#         Test.assert_equals(@jane.head.eyes.first.name, 'eye')
#       end
#     end
#   end

#   describe '#each' do
#     describe 'jane.has(2).arms.each { having(5).fingers }' do
#       before do
#         @jane = Thing.new('Jane')
#         @jane.has(2).arms.each { having(5).fingers }
#       end

#       it 'should cause 2 arms to be created each with 5 fingers' do
#         Test.assert_equals(@jane.arms.first.fingers.size, 5)
#         Test.assert_equals(@jane.arms.last.fingers.size, 5)
#       end
#     end
#   end

#   describe '#is_the' do
#     describe 'jane.is_the.parent_of.joe' do
#       before do
#         @jane = Thing.new('Jane')
#         @jane.is_the.parent_of.joe
#       end

#       it 'should set jane.parent_of == "joe"' do
#         Test.assert_equals(@jane.parent_of, 'joe')
#       end
#     end

#     describe 'ensure dynamic usages' do
#       it 'should set any name and value (jane.is_the.???.????)' do
#         @jane.is_the.mother_of.kate
#         Test.assert_equals(@jane.mother_of, 'kate')

#         @jane.is_the.master_of.karate
#         Test.assert_equals(@jane.master_of, 'karate')
#       end
#     end
#   end

#   describe '#being_the' do
#     describe 'jane.has(1).head.having(2).eyes.each { being_the.color.blue }' do
#       it "jane's eyes should both be blue" do
#         @jane = Thing.new('Jane')
#         @jane.has(1).head.having(2).eyes.each { being_the.color.blue }
#         Test.assert_equals(@jane.head.eyes.all? {|e| e.color == 'blue'}, true)
#       end
#     end

#     describe 'jane.has(2).eyes.each { being_the.color.blue.and_the.shape.round }' do
#       it 'should allow chaining via the and_the method' do
#         @jane = Thing.new('Jane')
#         @jane.has(2).eyes.each { being_the.color.blue.and_the.shape.round }
#         Test.assert_equals(@jane.eyes.first.color, 'blue')
#         Test.assert_equals(@jane.eyes.first.shape, 'round')
#       end
#     end

#     describe 'jane.has(2).eyes.each { being_the.color.green.having(1).pupil.being_the.color.black }' do
#       it 'should allow nesting by using having' do
#         @jane = Thing.new('Jane')
#         @jane.has(2).eyes.each { being_the.color.green.having(1).pupil.being_the.color.black }
#         Test.assert_equals(@jane.eyes.first.color, 'green')
#         Test.assert_equals(@jane.eyes.first.pupil.color, 'black')
#       end
#     end
#   end

#   describe '#can' do
#     describe 'jane.can.speak {|phrase| "#{name} says: #{phrase}"}' do
#       before do
#         @jane = Thing.new('Jane')
#         @jane.can.speak do |phrase|
#           "#{name} says: #{phrase}"
#         end
#       end

#       it 'should create a speak method on the instance' do
#         Test.assert_equals(@jane.speak('hi'), "Jane says: hi")
#       end

#     end
#     describe 'jane.can.speak("spoke") {|phrase| "#{name} says: #{phrase}"}' do
#       before do
#         @jane = Thing.new('Jane')
#         @jane.can.speak('spoke') do |phrase|
#           "#{name} says: #{phrase}"
#         end

#         @jane.speak('hi')
#       end

#       it 'should add a "spoke" attribute that tracks all speak call results' do
#         Test.assert_equals(@jane.spoke, ["Jane says: hi"])
#         @jane.speak('goodbye')
#         Test.assert_equals(@jane.spoke, ["Jane says: hi", "Jane says: goodbye"])
#       end
#     end
#   end
# end
