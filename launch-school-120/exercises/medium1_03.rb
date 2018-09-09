# medium1_03.rb

# Students

# Below we have 3 classes: Student, Graduate, and Undergraduate. Some details
# for these classes are missing. Make changes to the classes below so that the
# following requirements are fulfilled:

#     Graduate students have the option to use on-campus parking, while
#     Undergraduate students do not.

#     Graduate and Undergraduate students have a name and year associated with
#     them.

# Note, you can do this by adding or altering no more than 5 lines of code.

class Student
  def initialize(name, year, parking = false)
    @name = name
    @year = year
    @parking = parking
  end

  def parking_access?
    @parking
  end
end

Graduate = Class.new(Student) do
  def initialize(name, year)
    super(name, year, true)
  end
end

Undergraduate = Class.new(Student)

grad = Graduate.new('bob', 2000)
undergrad = Undergraduate.new('fred', 2002)
p grad.parking_access?
p undergrad.parking_access?
