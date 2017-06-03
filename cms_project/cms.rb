# require 'sinatra'
# require 'sinatra/reloader'
# require 'tilt/erubis'
# require 'redcarpet'

# require 'awesome_print'
# require 'yaml'

# ROOT = File.expand_path('..', __FILE__)

# configure do
#   enable :sessions
#   set :session_secret, 'secret'
# end

# helpers do
#   def extract_and_wrap_msg!
#     session.delete(:msg)&.sub(/\A(.+)\z/, '<p>\1</p>')
#   end

#   def render_markdown(content)
#     markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
#     markdown.render(content)
#   end

#   def load_file_content(path)
#     content = File.read(path)
#     case File.extname(path)
#     when '.txt'
#       headers['Content-Type'] = 'text/plain'
#       content
#     when '.md'
#       render_markdown(content)
#     end
#   end
# end

# before do
# end

# get '/' do
#   @files = Dir.glob(File.join(ROOT, '/data/*')).map { |path| File.basename(path) }
#   erb :index
# end

# get '/:filename' do
#   filename = params[:filename].to_s
#   file_path = File.join(ROOT, 'data', filename)

#   if File.file?(file_path)
#     load_file_content(file_path)
#   else
#     session[:msg] = "#{filename} does not exist."
#     redirect '/'
#   end
# end

# get '/test/t' do
#   session[:test] = 'test123'
# end

# get'/aaa/:omg' do
#   params[:omg]
# end


# ###########################################################
#     #   send_file file_path, type: :txt


# # We have 3 equations with 3 unknowns x, y, and z and we are to solve for these unknowns.

# # Equations 4x -3y +z = -10, 2x +y +3z = 0, and -x +2y -5z = 17 will be passed in as an array of [[4, -3, 1, -10], [2, 1, 3, 0], [-1, 2, -5, 17]] and the result should be returned as an array like [1, 4, -2] (i.e. [x, y, z]).

# # input: 3 arrays
#   # number to multiply x, y, z by, answer
# # output: values of x, y, z
# # rules:
#   # x, y, z are the same in each equation
# # steps:

# #   x +   y + z = answer

# #  4x -  3y + 1z = -10,
# #  2x +  1y + 3z = 0,
# # -1x +  2y - 5z = 17

# #   4  - 12 -  2 == -10
# #   2  +  4 -  6 ==   0
# #  -1  +  8 + 10 ==  17

# #  4x == -10 + 3y - z   x == (3y -  z - 10) / 4
# #  2x == -y - 3z        x == (-y - 3z) / 2
# #  -x == 17 - 2y + 5z   x ==  2y - 17 - 5z


# # x == x == x -------------------
# # (3y -  z - 10) / 4 == (-y - 3z) / 2 == 2y - 17 - 5z

# # (3y -  z - 10) / 4 == (-y - 3z)
# # 3y - z - 10 == -4y -12z

# # ############################### y == (-4y - 11z + 10) / 3
# # 3y == z + 10 - 4y - 12z
# # 7y == z + 10 - 12z

# # 7y == 10 - 11z
# # y == (10 - 11z) / 7

# # (-y - 3z) / 2 == 2y - 17 - 5z
# #  -y - 3z == 4y - 34 - 10z
# #  -y == 3z + 4y - 34 - 10z
# #  -y == -7z + 4y - 34
# # -5y == -7z - 34
# #   y == (-7z - 34) / -5

# #  y == y -------------
# # (10 - 11z) / 7 == (-7z - 34) / -5
# # 10 - 11z == 7 * ((-7z - 34) / -5)
# #             7/1 * 3/5  21/5

# # 10 - 11z ==     7           -7z - 34
# #                ---    *   ---------------
# #                 1              -5

# #  10 - 11z == -49z - 238 / -5
# # -50 + 55z == -49z - 238
# #   55z == -49z - 188
# #   104z == -188

# #  z == -1.8076923076923077   -2

#  # (10 - 11z) / 7

# # y == 4.269230769230769    4

# # 2y - 17 - 5z
# # 2(4.269230769230769) - 17 - 5(-1.8076923076923077)
# # 8.538461538461538  - 17 + -5 * -1.8076923076923077
# #        8.538461538461538  - 17 +                     9.038461538461538

# def solve_eq(eq1, eq2, eq3)

# end



# solve_eq([[4, -3, 1, -10], [2, 1, 3, 0], [-1, 2, -5, 17]] == [1, 4, -2]
# solve_eq([[2, 1, 3, 10], [-3, -2, 7, 5], [3, 3, -4, 7]] == [-1, 6, 2]
# solve_eq([[3, 2, 0, 7], [-4, 0, 3, -6], [0, -2, -6, -10]] == [3, -1, 2]
# solve_eq([[4, 2, -5, -21], [2, -2, 1, 7], [4, 3, -1, -1]] == [1, 0, 5]
# solve_eq([[1, 1, 1, 5], [2, 2, 3, 14], [2, -3, 2, -5]] == [-2, 3, 4]



def depth(arr)
  arr.any? { |x| x.is_a?(arr.class) } ? 1 + depth(arr.flatten(1)) : 1
end

# p depth([]) == 1
# p depth([1]) == 1
# p depth([1, 2]) == 1
# p depth([1, [2]]) == 2
# p depth([1, [2, 2]]) == 2
# p depth([1, [2, [3]]]) == 3
# p depth([1, [2, [3, [4], 3]]]) == 4
# p depth([1, [[], [3, [], 3]]]) == 4
# p depth([1, [[], [3, [[]], 3]]]) == 5


def depth(array)
  return 1 unless array.any? { |arr| arr.is_a?(Array) }
  flattened_array = array.flatten(1)
  1 + depth(flattened_array)
end

# def find_array_depth(array)
#   depth_counter = 1
#   array.each do |element|
#     if element.is_a?(Array)
#       depth_coutner += 1

#     end
# end

# def depth(arr)
#   arr.each do |a|
#     if a.is_a?(Array)
#       find_array_depth(a)
#     end
#   end
# end

def find_array_depth(array)
  depth_counter = 0
  temp = 1
  # p array                                             # => [2], [2, 2], [2, [3]], [3], [2, [3, [4], 3]], [3, [4], 3], [4], [[], [3, [], 3]], [3, [], 3], [[], [3, [[]], 3]], [3, [[]], 3], [[]]
  array.each do |element|
    if element.is_a?(Array)
      temp += 1
      next if element[0] == nil
      find_array_depth(element)
    end
    depth_counter = temp unless temp < depth_counter
  end
    depth_counter
end

def depth(arr)
  counter_for_depth = 1
  arr.each do |a|
    if a.is_a?(Array)
     counter_for_depth += find_array_depth(a)
    end
  end
p  counter_for_depth
end

p depth([]) ==
 1
p depth([1]) ==
 1
p depth([1, 2]) ==
 1
p depth([1, [2]]) ==
 2
p depth([1, [2, 2]]) ==
 2
p depth([1, [2, [3]]]) ==
 3
p depth([1, [2, [3, [4], 3]]]) ==
 4
p depth([1, [[], [3, [], 3]]]) ==
 4
p depth([1, [[], [3, [[]], 3]]]) ==
 5




# Write a method that finds the max depth in the array.

# i.e.

#set a counter to 0
  # at each level of the array
    #increment counter += 1
#once the last level has been reached
  #return the counter


def find_array_depth(array)
  depth_counter = 0
  temp = 1

  array.each do |element|
    if element.is_a?(Array)
      temp += 1
      next if element[0] == nil
      find_array_depth(element)
    end
    depth_counter = temp unless temp < depth_counter
    temp = 1
  end
    depth_counter
end


# def depth(arr)
#   counter_for_depth = 1
#   arr.each do |a|
#     if a.is_a?(Array)
#      counter_for_depth += find_array_depth(a)
#     end
#   end
#   counter_for_depth
# end

# #NICK's
# def depth(array)
#   return 1 unless array.any? { |arr| arr.is_a?(Array) }
#   flattened_array = array.flatten(1)
#   1 + depth(flattened_array)
# end


# # 1
# def depth(arr)
#   arr.any? { |x| x.is_a?(Array) } ? 1 + depth(arr.flatten(1)) : 1
# end

# p depth([]) == 1
# p depth([1]) == 1
# p depth([1, 2]) == 1
# p depth([1, [2]]) == 2
# p depth([1, [2, 2]]) == 2
# p depth([1, [2, [3]]]) == 3
# p depth([1, [2, [3, [4], 3]]]) == 4
# p depth([1, [[], [3, [], 3]]]) == 4
# p depth([1, [[], [3, [[]], 3]]]) == 5

#   # [[], [3, [[]], 3]]
#   # []
#   # [3, [[]], 3]
#   #  [[]]
#   # []
#   # nil