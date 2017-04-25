# CLASS METHODS

=begin

- 'class method' b/c:
  - called directly on the class, w/o having to instantiate any objects
- define on class itself

--WHY?:
  - functionaility that does not pertain to individual objects
    - perform operations at the class level
    - when we don't need to deal w/ states
    - ex: expose a class method to return value of a class var

=end

class SmartPhone
  # we can validate an IMEI number without needing to instantiate a SmartPhone object, we just need to know the number we want to validate.
  def self.validate_imei(number) # define method on the class itself.
    'validating IMEI number...'
  end

  # Alternative way to define using class name:
  def SmartPhone.validate_imei(number)
    'validating IMEI number...'
  end
end

# call class methods on the constant that references the class as the receiver:
SmartPhone.validate_imei(12345)



# expose a class method to return value of a class var:
  # @@number_of_phones...