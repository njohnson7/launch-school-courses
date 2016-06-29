# easy9_09_grade_book.rb
# Grade book

# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.

# Numerical Score Letter Grade 90 <= score <= 100 'A' 80 <= score < 90 'B' 70 <=
# score < 80 'C' 60 <= score < 70 'D' 0 <= score < 60 'F'

# Tested values are all between 0 and 100. There is no need to check for
# negative values or values greater than 100.

def get_grade(*scores)
  average = scores.reduce(:+) / scores.size
  case average
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(50, 50, 95, 60, 31) == "F"
p get_grade(70, 40, 100, 85) == "C"
p get_grade(75, 95) == "B"
p get_grade(0) == "F"
p get_grade(0, 10, 20, 30, 40, 50, 60, 70, 80, 90) == "F"
p get_grade(100) == "A"
p get_grade(90) == "A"
p get_grade(80) == "B"
p get_grade(70) == "C"
p get_grade(60) == "D"
p get_grade(59) == "F"
puts


# How would you handle this if there was a possibility of extra credit grades
# causing it to exceed 100 points?
def get_grade(*scores)
  average = scores.reduce(:+) / scores.size
  case average
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  when 0...60  then 'F'
  else              'S'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(50, 50, 95, 60, 31) == "F"
p get_grade(70, 40, 100, 85) == "C"
p get_grade(75, 95) == "B"
p get_grade(0) == "F"
p get_grade(0, 10, 20, 30, 40, 50, 60, 70, 80, 90) == "F"
p get_grade(100) == "A"
p get_grade(90) == "A"
p get_grade(80) == "B"
p get_grade(70) == "C"
p get_grade(60) == "D"
p get_grade(59) == "F"

p get_grade(95, 90, 93, 120, 150) == "S"
p get_grade(100, 103) == "S"
p get_grade(101) == "S"
