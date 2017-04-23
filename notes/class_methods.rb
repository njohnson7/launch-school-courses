# CLASS METHODS

=begin

 - class methods are methods we can call directly on the class itself, w/o having to instantiate any objects
 - define by prepending the method name w/ self keyword
 - where we put functionaility that does not pertain to individual objects
   - when we have a method that doesn't need to deal w/ states
   - to perform operations at the class level
 - called a class method b/c they are defined on the class itself:
   - ex: self.method_name   or   GoodDog.method_name

=end

# define and call
  # ex: gas_mileage, total_number_of_dogs
    # all cars need to calc gas mileage, and how to do it doesn't differ among different cars

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




# @@number_of_phones...