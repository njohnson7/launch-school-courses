=begin

- classes vs. modules:
  - both contain shared behavior and constants
  - modules:
    - cannot be used to instantiate objects
    - cannot be inherited
      - instead they are mixed in to a class/module by invoking Module#include
        - their instance methods are then available to objects of that class
- Module:
  - A collection of behaviors useable in other classes via mixins
  - Another way to apply polymorphic structure to a program

=end

module M1
  def testing
    42
  end
end

module M2
  include M1
end

class C
  include M2
end

C.new.testing
