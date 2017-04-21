# ACCESSOR METHODS

=begin

  - getter methods:
     - expose an object's state (ivar)
     - return the value referenced by an ivar
  - setter methods:
    - expose a method that allows us to change an object's state (ivar)
    - initializes or reassigns an ivar to value passed in as an argument
    - syntactical sugar:
      - Ruby recognizes setter methods and allows us to use more natural assignment syntax
  - naming convention: use the same name as ivar
  - Module#attr_accessor :
    - automatically defines getter/setter methods
    - b/c these methods are so commonly used
    - takes 1+ symbols as argument(s) which it uses to create the method names
  - attr_reader, attr_writer
  - can be invoked in a class def instead of directly referencing an ivar
    - it's generally better to call a getter/setter method instead of direct reference
      - ie, in situations where we don't want to expose raw data
      - pre-processing
  - setter methods must be called w/ an explicit receiver
    - any instance method can be called w/i a class def by prefixing self (except private!)

=end

# manual getter and setters (downsides - take up a lot of room for a simple feature)
  # syntactical sugar
# attr_*s
# calling outside of a class def
# calling within a class def
# ex: @ssn, masking all digits except last 4
  # reference a getter method, so we can just make the change in one place if there's a bug or we need to modify the format

# local var assignment vs setter method call

