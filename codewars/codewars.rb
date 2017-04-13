def luckySevens(arr)
  count = 0
  arr[1..-2].each.with_index(1) do |row, x|
    row[1..-2].each.with_index(1) do |num, y|
      next unless num == 7
      sum = row[y - 1] + row[y + 1] + arr[x - 1][y] + arr[x + 1][y]
      count += 1 if Math.cbrt(sum) % 1 < 0.000000001
    end
  end
  count
end

# testBoard0 = [[ 740, 183, 194, 902, 297 ],
#               [ 772, 355, 668, 54,  993 ],
#               [ 72 , 7,   229, 169, 164 ],
#               [ 730, 73,  13,  7,   3   ],
#               [ 26 , 570, 955, 31,  116 ]]
# p luckySevens(testBoard0)  # 2

# testBoard1 = [[ 647, 25,  530, 200, 438, 635 ],
#               [ 10,  7,   19,  17,  439, 7   ],
#               [ 271, 10,  3,   7,   5,   187 ],
#               [ 768, 430, 876, 2,   335, 57  ],
#               [ 21,  7,   229, 108, 7,   63  ],
#               [ 939, 49,  199, 611, 6,   513 ]]
# p luckySevens(testBoard1)  # 4

# testBoard2 = [[ 74,  4,   837, 849, 68,  7,   365, 657 ],
#               [ 622, 7,   502, 520, 34,  112, 7,   31  ],
#               [ 909, 345, 190, 7,   7,   17,  4,   7   ],
#               [ 465, 31,  7,   79,  6,   216, 108, 7   ],
#               [ 113, 977, 43,  771, 6,   457, 507, 953 ],
#               [ 654, 786, 648, 145, 7,   182, 7,   230 ],
#               [ 478, 328, 30,  7,   98,  825, 81,  384 ],
#               [ 929, 74,  261, 70,  968, 638, 7,   109 ]]
# p luckySevens(testBoard2)  # 5

# testBoard3 = [[ 506, 664, 946, 363, 56,  144, 706, 74,  177, 7,   694 ],
#               [ 437, 474, 348, 25,  7,   36,  370, 22,  7,   78,  45  ],
#               [ 7,   261, 48,  821, 8,   181, 7,   115, 66,  715, 7   ],
#               [ 734, 67,  724, 904, 312, 446, 63,  894, 4,   300, 838 ],
#               [ 11,  7,   24,  153, 7,   18,  743, 1,   7,   2,   823 ],
#               [ 139, 23,  16,  7,   29,  7,   53,  410, 1,   65,  509 ],
#               [ 744, 1,   7,   7,   128, 174, 230, 131, 21,  7,   33  ],
#               [ 341, 253, 3,   870, 38,  7,   113, 671, 99,  6,   744 ],
#               [ 632, 723, 320, 430, 61,  18,  37,  28,  7,   69,  936 ],
#               [ 383, 7,   753, 19,  7,   36,  654, 781, 20,  921, 969 ],
#               [ 283, 334, 463, 7,   9,   143, 411, 443, 958, 7,   7   ]]
# p luckySevens(testBoard3)  # 11

# testBoard4 = [[ 186, 946, 992, 578, 286, 10,  295, 499, 369 ],
#               [ 408, 16,  347, 608, 827, 7,   7,   727, 858 ],
#               [ 5,   7,   4,   638, 409, 472, 817, 1,   531 ],
#               [ 792, 2,   179, 7,   133, 684, 0,   7,   0   ],
#               [ 764, 374, 962, 50,  46,  95,  474, 0,   460 ],
#               [ 165, 7,   133, 5,   7,   11,  825, 40,  626 ],
#               [ 240, 57,  954, 447, 2,   551, 1,   7,   17  ],
#               [ 7,   738, 7,   450, 37,  7,   120, 6,   7   ],
#               [ 7,   683, 902, 66,  402, 21,  870, 323, 233 ]]
# p luckySevens(testBoard4)  # 7



FOODS = { "chickenwings" => 5, "hamburgers" => 3, "hotdogs" => 2 }

def scoreboard(arr)
  arr.map { |hsh| [['name', hsh['name']], ['score', hsh.map { |k, v| FOODS[k].to_i * v.to_i }.reduce(0, :+)]].to_h }
     .sort_by { |hsh| [-hsh['score'], hsh['name']] }
end




def histogram(results)
  results.map.with_index(1) { |num, idx| "#{idx}|#{'#' * num}#{" #{num}" if num > 0}\n" }
         .reverse.join
end



def palindrome(num)
  return 'Not valid' unless num.is_a?(Integer) && num.positive?
  digits = num.to_s.chars
  palindromes = (2..digits.size).flat_map { |size| digits.each_cons(size).to_a }
                                .map(&:join)
                                .select { |n| !n[/\A0.*0\z/] && n == n.reverse }
                                .map(&:to_i)
                                .uniq
                                .sort
  palindromes.empty? ? 'No palindromes found' : palindromes
end



# p palindrome(2)   #"No palindromes found"
# p palindrome(1551)   #[55,1551]
# p palindrome(221122)   #[11,22,2112,221122]
# p palindrome(10015885)   #[88,1001,5885]
# p palindrome(13598)   #"No palindromes found"
# p palindrome("ACCDDCCA")   #"Not valid"
# p palindrome("1551")   #"Not valid"
# p palindrome(-4505)   #"Not valid"





def sort_it_out(array)
  array.partition { |num| num.to_i.odd? }
       .tap { |odds, evens| return odds.sort + evens.sort.reverse }
end

# p sort_it_out([26,243,52,2,432414,1,11,46,32]) == [1,11,243,432414,52,46,32,26,2]
# p sort_it_out([19,65,88,112,60,14,33,49,88]) == [19,33,49,65,112,88,88,60,14]
# p sort_it_out([]) == []
# p sort_it_out([68,25,99,50,10,67,2,5,8,34,67]) == [5,25,67,67,99,68,50,34,10,8,2]
# p sort_it_out([11,22,33,44,55,55,90.4,4,78]) == [11,33,55,55,90.4,78,44,22,4]




def bubble_sort_official!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

def bubble_sort!(arr, n = arr.size)
  n.zero? ? (return arr) : new_n = 0
  (1...n).each do |idx|
    next if arr[idx - 1] <= arr[idx]
    arr[idx - 1], arr[idx], new_n = arr[idx], arr[idx - 1], idx
  end
  bubble_sort!(arr, new_n)
end



def benchmark
  start = Time.now
  yield
  puts "Duration: #{Time.now - start} seconds"
end

# arr = Array.new(10_000) { rand(1..1000) }
# arr_copy = arr.dup

# benchmark { bubble_sort_official!(arr) }  # 7.11 seconds
# benchmark { bubble_sort!(arr_copy) }      # 5.19 seconds
# puts

# arr = Array.new(30_000) { rand(1..2) }
# arr_copy = arr.dup

# benchmark { bubble_sort_official!(arr) }
# benchmark { bubble_sort!(arr_copy) }


# name = method to be created
# block will be called 1st time method is accessed
# return value of block will be used as value of method
# remove any question makrs in name
# only call the block and assign its return value to the var if var has not
#  already been set directly

# ex:
  # attr_lazy(:even) { ... } # value will be stored as @even variable
  # attr_lazy(:even?) { ... } # value will be stored as @even variable

module AttrLazy
  def attr_lazy(name, &block)
    ivar_name = "@#{name.to_s.chomp('?')}"
    define_method name do
      return instance_variable_get(ivar_name) if instance_variable_defined?(ivar_name)
      instance_variable_set(ivar_name, instance_eval(&block))
    end
  end
end

class Numbers
  extend AttrLazy

  def initialize(*numbers)
    @numbers = numbers
  end

  attr_lazy :evens do
    @numbers.select(&:even?)
  end

  attr_lazy :even? do
    @numbers.all?(&:even?)
  end

  def mark_even
    @even = true
  end
end

# # describe 'AttrLazy' do
# #   it 'should return the value provided by the block' do
# example = Numbers.new(1,2)
# p example.evens  # [2]
# p example.even?  # false

#   # it 'should not call the block if the variable is set manually' do
# example = Numbers.new(1)
# example.mark_even
# p example.instance_variable_get(:@even)
# p example.even?  # true

# class Integer

# end

def add(n)
  add_proc = proc do |num|
    return n if num.nil?
    n += num
    # self
    # num.nil? ? (return n) : n += num
  end
  # sum = add_proc.call
  add_proc
end

# def add_proc(num)
#   return n if num.nil?
# end

def add(n)
  addable(n)
end

# def addable(num = nil)
#   proc { |n| n ? addable(num + n) : num }
# end

# def add(n)
#   addable(n)
# end

# class Addable
#   def initialize(num)
#     @num = num
#   end

#   def call(num = nil)
#     if num
#       Addable.new(num + @num)
#     else
#       @num
#     end
#   end
# end

# class Integer
#   # def call(n)
#   #   self + n
#   # end

#   alias call +
# end

# def add(n)
#   n
# end





def add(n)
  n.tap { Integer.class_eval { alias call + } }
end


# p add(1) #== 1
# p add(1).(2) #== 3
# p add(1).(2).(3) #== 6






# module Constantable
#   CONSTANT4 = 'Constantable module'
# end

# class Object
#   include Constantable
#   CONSTANT5 = 'Object constant'
# end

# CONSTANT1 = 'outer'
# module Animal
#   CONSTANT2 = 'middle'
#   class Dog
#     # include Constantable
#     CONSTANT3 = 'inner'
#     p CONSTANT1         # => 'outer'
#     p CONSTANT2         # => 'middle'
#     p CONSTANT3         # => 'inner'
#     p CONSTANT4         # => "Constantable module"
#     p CONSTANT5         # => "Object constant"
#     puts
#     p Module.nesting    # => [Animal::Dog, Animal]
#     p constants         # => [:CONSTANT3]
#     p constants(false)  # => [:CONSTANT3]
#     p Module.constants.grep(/CONST/)
#       # => [:CONSTANT3, :CONSTANT2, :CONSTANT5, :CONSTANT1] -- (no CONSTANT4 ??)
#   end
#   module Cat
#     module Meercat; end
#     p Meercat.ancestors  # => [Animal::Cat::Meercat]
#   end
#   p Cat.ancestors        # => [Animal::Cat]
# end

# # Constantable included in Animal::Dog:
# p Animal::Dog.ancestors   # => [Animal::Dog, Constantable, Object, Kernel, BasicObject]
# # order of lookup: 'inner', 'middle', 'Constantable module', 'outer'

# # Constantable included in Object:
# p Animal::Dog.ancestors   # => [Animal::Dog, Object, Constantable, Kernel, BasicObject]
# # order of lookup: 'inner', 'middle', 'outer', 'Constantable module'
# p Constantable.ancestors  # => [Constantable]
# puts

# class Vehicle
#   WHEELS = 4
# end

# module Maintenance
#   def change_tires
#     p Maintenance.constants           # => []
#     p Module.constants.grep(/WHEEL/)  # => []
#     p self                            # => #<Car:0x00000001e66288>
#     p Module.nesting                  # => [Maintenance]
#     puts
#     # "Changing #{WHEELS} tires."
#   end
# end

# class Car < Vehicle
#   WHEELS = 2
#   include Maintenance
#   p constants  # => [:WHEELS]
# end

# a_car = Car.new
# p a_car.change_tires
# p Maintenance.ancestors  # => [Maintenance]
# p Car.ancestors # [Car, Maintenance, Vehicle, Object, Constantable, Kernel, BasicObject]

# module Maintenance
#   def change_tires
#     # "Changing #{WHEELS} tires."  # => NameError
#   end
# end

# a_car = Car.new
# p a_car.change_tires



# module A
#   A_CONSTANT = 'I am defined in module A'
#   module B
#     module C
#       def self.inspect_nesting
#         puts Module.nesting.inspect
#         # puts Module.ancestors.inspect
#         puts A_CONSTANT
#       end
#     end
#   end
# end

# A::B::C.inspect_nesting
# # [A::B::C, A::B, A]
# # I am defined in module A


# module Screen
#   DEFAULT_RESOLUTION = [1024, 768]
#   module Widgets
#     module MacOS; end
#   end
# end

# module Screen::Widgets::MacOS::Button
#   def self.inspect_nesting
#     puts Module.nesting.inspect
#     puts DEFAULT_RESOLUTION
#   end
# end

# # Screen::Widgets::MacOS::Button.inspect_nesting
# # [Screen::Widgets::MacOS::Button]
# # (NameError) - uninitialized constant
# #   Screen::Widgets::MacOS::Button::DEFAULT_RESOLUTION
# puts



# module WTF
#   def print_const
#     puts XYZ
#   end
# end

# XYZ = 1
# include WTF
# print_const


# module WTF2
# end

# class OMG
#   XYZ2 = 3
#   # include WTF2
#   p Module.nesting
# end

# module WTF2
#   def print_const
#     # puts XYZ2
#   end
# end

# p OMG.ancestors
# # OMG.new.print_const
# omg = OMG.new
# omg.extend(WTF2)
# omg.print_const
# puts


# module MyModule
#   def print_constant
#     puts KONSTANT
#   end
# end

# class MyClass
#   KONSTANT = 1
#   include MyModule
# end

# obj = MyClass.new
# p MyClass.ancestors
# obj.print_constant



# # Multiple inheritance:
# class Animal; end
# class Mammal < Animal; end
# class Bird < Animal; end
# class SwimmingAnimal < Animal; end
# class TalkingAnimal < Animal; end
# class FlyingAnimal < Animal; end
# class Pet < Animal; end

# class Dog < Mammal, SwimmingAnimal, Pet; end
# class Cat < Mammal, Pet; end
# class Gorilla < Mammal, TalkingAnimal; end
# class Penguin < Bird, SwimmingAnimal; end
# class Parrot < Bird, TalkingAnimal, FlyingAnimal, Pet; end
# class Dove < Bird, FlyingAnimal; end


# # Mixing in modules:
# module Swimmable; end
# module Talkable; end
# module Flyable; end
# module Pet; end
# class Animal; end
# class Mammal < Animal; end
# class Bird < Animal; end

# class Dog < Mammal
#   include Swimmable, Pet
# end

# class Cat < Mammal
#   include Pet
# end

# class Gorilla < Mammal
#   include Talkable
# end

# class Penguin < Bird
#   include Swimmable
# end

# class Parrot < Bird
#   include Talkable, Flyable, Pet
# end

# class Dove < Bird
#   include Flyable
# end





# 4 ops:     plus, minus, times, divided_by
# 10 digits: zero, one, two, three, four, five, six, seven, eight, nine

class Calc
  KEY = { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7,
          eight: 8, nine: 9, plus: :+, minus: :-, times: :*, divided_by: :/ }

  def method_missing(method_name)
    @methods ||= []
    @methods << method_name
    if @methods.size == 3
      num1, op, num2 = @methods.map { |cmd| KEY[cmd] }
      return num1.send(op, num2)
    end
    self
  end
end


# p Calc.new.one.plus.two             # 3
# p Calc.new.five.minus.six           # -1
# p Calc.new.seven.times.two          # 14
# p Calc.new.nine.divided_by.three    # 3
# p Calc.new.four.plus.five           # 9
# p Calc.new.five.plus.four           # 9

ORDS = Regexp.new(('a'..'z').map(&:ord).join('|'))

def decipher(cipher)
  cipher.scan(ORDS).map { |ord| ord.to_i.chr }.join
end

# ORDS = Regexp.new(('a'..'z').map(&:ord).join('|'))

def decipher(cipher)
  cipher.gsub(ORDS) { |ord| ord.to_i.chr }
end

# p decipher("10197115121")  # "easy"
# p decipher("98")  # "b"
# p decipher("122")  # "z"




def html_end_tag_by_start_tag(start_tag)
  "</#{start_tag[/<([^ >]+)/, 1]}>"
end

# p html_end_tag_by_start_tag("<button type='button' disabled>") # "</button>")
# p html_end_tag_by_start_tag("<i>") # "</i>")
# p html_end_tag_by_start_tag("<div id='my_area' class='data' title='This is a test for title on Div tag'>")
# # "</div>")



def range_bit_count(a, b)
  (a..b).map { |n| n.to_s(2) }.join.count('1')
end

# p range_bit_count(2,7)  #11
# p range_bit_count(0,1)  # 1
# p range_bit_count(4,4)  # 1




def late_ride(n)
  n.divmod(60).join.chars.map(&:to_i).reduce(:+)
end

# p late_ride(240)    # 4
# p late_ride(808)    # 14
# p late_ride(1439)    # 19
# p late_ride(0)    # 0
# p late_ride(23)    # 5
# p late_ride(8)    # 8


# class Circle
#   def add
#     +
#   end

#   private

#   def +@
#     42
#   end
# end

# p Circle.new.add






def sort_by_height(arr)
  people = arr.reject { |num| num == -1 }.sort
  arr.map { |elem| elem == -1 ? -1 : people.shift }
end


# p sort_by_height([-1, 150, 190, 170, -1, -1, 160, 180])
# # [-1, 150, 160, 170, -1, -1, 180, 190])
# p sort_by_height([-1, -1, -1, -1, -1]) # [-1, -1, -1, -1, -1])
# p sort_by_height([4, 2, 9, 11, 2, 16]) # [2, 2, 4, 9, 11, 16])


# def palindrome_rearranging(s)
#   chars = s.chars
#   single = chars.find { |char| chars.count(char) == 1 }
#   chars.delete(single)
#   chars.uniq.all? { |char| chars.count(char).even? }
# end

# p palindrome_rearranging("aabb")   # true
# p palindrome_rearranging("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaabc")   # false
# p palindrome_rearranging("abbcabb")   # true
# p palindrome_rearranging("zyyzzzzz")   # true
# "zzzzfzfzz"



# def middle_permutation(string)
#   perms = string.chars.sort.permutation.to_a
#   perms[perms.size / 2 - 1].map { |c| string.index(c) }
# end

# p middle_permutation("a")           # "a"           [0]
# p middle_permutation("ab")          # "ab"          [0, 1]
# p middle_permutation("abc")         # "bac"         [1, 0, 2]
# p middle_permutation("abcd")        # "bdca"        [1, 3, 2, 0]
# p middle_permutation("abcdx")       # "cbxda"       [2, 1, 4, 3, 0]
# p middle_permutation("abcdxg")      # "cxgdba"      [2, 4, 5, 3, 1, 0]
# p middle_permutation("abcdxgz")     # "dczxgba"     [3, 2, 6, 4, 5, 1, 0]
# p middle_permutation("abcdefgh")    # "dhgfecba"    [3, 7, 6, 5, 4, 2, 1, 0]
# p middle_permutation("abcdefghi")   # "edihgfcba"   [4, 3, 8, 7, 6, 5, 2, 1, 0]
# # p middle_permutation("abcdefghij")  # "ejihgfdcba"[4, 9, 8, 7, 6, 5, 3, 2, 1, 0]
# # p middle_permutation("abcdefghijk")#"fekjihgdcba" [5, 4,10, 9, 8, 7, 6, 3, 2, 1, 0]



# p middle_permutation("a")           # "a"           [0]
# p middle_permutation("ab")          # "ab"          [0, 1]
# p middle_permutation("abc")         # "bac"         [1, 0, 2]
# p middle_permutation("abcd")        # "bdca"        [1, 3, 2,                      0]
# p middle_permutation("abcdx")       # "cbxda"       [2, 1, 4, 3,                   0]
# p middle_permutation("abcdxg")      # "cxgdba"      [2, 4, 5, 3,                1, 0]
# p middle_permutation("abcdxgz")     # "dczxgba"     [3, 2, 6, 4, 5,             1, 0]
# p middle_permutation("abcdefgh")    # "dhgfecba"    [3, 7, 6, 5, 4,          2, 1, 0]
# p middle_permutation("abcdefghi")   # "edihgfcba"   [4, 3, 8, 7, 6, 5,       2, 1, 0]
# # p middle_permutation("abcdefghij")  # "ejihgfdcba"[4, 9, 8, 7, 6, 5,    3, 2, 1, 0]
# # p middle_permutation("abcdefghijk")#"fekjihgdcba" [5, 4,10, 9, 8, 7, 6, 3, 2, 1, 0]
# puts

# a = [0, 1]
# b = [1, 0, 2]
# # b.reverse.shift
# # b = [1, 0, 2]
# p b.reverse.rotate(-2)

# a = [1, 0, 2]
# b = [1, 3, 2, 0]
# p b.reverse.rotate(-1)

# a = [1, 3, 2, 0]
# b = [2, 1, 4, 3, 0]
# p b.reverse


# # [0]
# # [0, 1]
# # [1, 0, 2]                          [n, n - 1, n * 2]
# # [1, 3, 2, 0]
# # [2, 1, 4, 3, 0]                    [n, n - 1, n * 2, (n * 2) - 1, 0]
# # [2, 4, 5, 3, 1, 0]
# # [3, 2, 6, 4, 5, 1, 0]              [n, n - 1, n * 2, (n * 2) - 1, ]
# # [3, 7, 6, 5, 4, 2, 1, 0]
# # [4, 3, 8, 7, 6, 5, 2, 1, 0]        [n, n - 1, n * 2, (n * 2) - 1, ]
# # [4, 9, 8, 7, 6, 5, 3, 2, 1, 0]
# # [5, 4,10, 9, 8, 7, 6, 3, 2, 1, 0]  [n, n - 1, n * 2, (n * 2) - 1, ]