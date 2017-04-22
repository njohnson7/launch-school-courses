# PUBLIC PRIVATE PROTECTED METHODS

=begin

- public methods:
  - a method that is available to anyone who knows either the class name or the object's name
  - these methods are readily available for the rest of the program to use
  - comprise the class's interface:
    - how other classes and objects will interact w/ this obj and class
- private methods:
  - methods that are doing work in the class, but don't need to be available to the rest of the program
  - any methods defined following Module#private will be private
  - only accessible from inside the class def when called w/o self (explicit receiver)
    - except for private setter methods! (must be called w/ self)
- protected methods:
  - from outside a class def, act just like private methods
  - from inside a class def, accessible just like public methods
  - useful for comparing attributes that we don't want to expose a public interface to
- inherited methods maintain their public/protected/private status (visibility)
- exposing a public interface by defining a public instance method that calls a private instance method can allow us to do some conditional check or verification to see if the method caller should be able to call the private method.


=end

# refactoring human_years method to private to get dog years
  # creating a public method to display human years
# example of trying to call a private method from outside a class def
# calling a private method w/ self
# calling a protected method w/ and w/o self
# calling a protected method outside a class def
# protected method for comparison (ex: of students' grades)

# 2 ways to fix a NoMethodError: private method `..' called... :
  # change to public by defining above #private invocation
  # define a public method that calls the private method from w/i the class
    # exposing a public interface allows us to do some conditional check to see if this user can indeed be able to call this method


'((([["{{}}"]])))'.match(/\(.*\)/)   # => #<MatchData "((([[\"{{}}\"]])))">
'((([["{{}}"]])))'.match(/\(.*?\)/)  # => #<MatchData "((([[\"{{}}\"]])">
'((([["{{}}"]])))'                   # => "((([[\"{{}}\"]])))"

'((([["{{}}"]])'  # => "((([[\"{{}}\"]])"