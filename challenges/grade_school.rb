# Write a small archiving program that stores students' names along with the
# grade that they are in.

# In the end, you should be able to:

#     Add a student's name to the roster for a grade
#         "Add Jim to grade 2."
#         "OK."
#     Get a list of all students enrolled in a grade
#         "Which students are in grade 2?"
#         "We've only got Jim just now."
#     Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., and students within a grade should be sorted alphabetically by name.
#         "Who all is enrolled in school right now?"
#         "Grade 1: Anna, Barb, and Charlie. Grade 2: Alex, Peter, and Zoe. Grade 3…"

# Note that all our students only have one name.

# class School
#   def initialize
#     @roster = Hash.new { |hsh, k| hsh[k] = [] }
#   end

#   def add(name, grade_num)
#     @roster[grade_num] << name
#   end

#   def grade(grade_num)
#     @roster.fetch(grade_num, [])
#   end

#   def to_h
#     @roster.sort.to_h.transform_values(&:sort)
#   end
# end



# class School
#   def initialize
#     @roster = Hash.new { |hsh, k| hsh[k] = [] }
#   end

#   def add(name, grade_num)
#     @roster[grade_num].push(name).sort!
#   end

#   def grade(grade_num)
#     @roster.fetch(grade_num, [])
#   end

#   def to_h
#     @roster.sort.to_h
#   end
# end


# class School
#   def initialize
#     @roster = Hash.new([])
#   end

#   def add(name, num)
#     @roster[num] += [name]
#   end

#   def grade(num)
#     @roster[num]
#   end

#   def to_h
#     @roster.sort.to_h.transform_values(&:sort)
#   end
# end


# School = Class.new do
#   define_method(:initialize) { @roster = Hash.new([]) }
#   define_method(:add)        { |name, num| @roster[num] += [name] }
#   define_method(:grade)      { |num| @roster[num] }
#   define_method(:to_h)       { @roster.sort.to_h.transform_values(&:sort) }
# end


# School = Class.new do
#   method_names = %i[initialize add grade to_h]
#   method_bodies = [ -> { @roster = Hash.new([]) },
#                     -> (name, num) { @roster[num] += [name] },
#                     -> (num) { @roster[num].sort },
#                     -> { @roster.sort.to_h.transform_values(&:sort) } ]
#   method_names.zip(method_bodies).each { |name, body| define_method(name, &body) }
# end


School = Class.new do
  method_names = %i[initialize add grade to_h]
  method_bodies = [ -> { @roster = Hash.new([]) },
                    -> (name, num) { (@roster[num] += [name]).sort! },
                    -> (num) { @roster[num] },
                    -> { @roster.sort.to_h } ]
  method_names.zip(method_bodies)
              .each { |name, body| define_method(name, body) }
end

