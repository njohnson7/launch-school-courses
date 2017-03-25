# Write a program that cleans up user-entered phone numbers so that they can be
# sent as SMS messages.

# The rules are as follows:

#     If the phone number is less than 10 digits assume that it is bad number
#     If the phone number is 10 digits assume that it is good
#     If the phone number is 11 digits and the first number is 1, trim the 1
#      and use the last 10 digits

#     If the phone number is 11 digits and the first number is not 1, then it
#      is a bad number
#     If the phone number is more than 11 digits assume that it is a bad number

# algorithm:
  # bad:
    # num < 10 digits
    # num is 11 digits and first digit is not 1
    # num > 11 digits
  # good:
    # num is 10 digits or 11 digits and starts w/ 1
      # -> trim the 1 and use last 10 digits


# class PhoneNumber
#   attr_reader :number

#   def initialize(num)
#     # @number = '0' * 10 unless num[/\A1?\(?(\d{3})\)?[ .-]?(\d{3})[ .-]?(\d{4})\z/]
#     # @number ||= "#{$1}#{$2}#{$3}"
#     @number = num.match(/\A1?\(?(\d{3})\)?[ .-]?(\d{3})[ .-]?(\d{4})\z/)
#                   &.[](1,3)&.join || '0' * 10
#     # num = num.delete(' ()-.')
#     # @number = num[/\A1?\d{10}\z/] ? num[-10..-1] : '0' * 10

#     # @number = if num[/\A1?\(?(\d{3})\)?[ .-]?(\d{3})[ .-]?(\d{4})\z/]
#                 # num.delete('^0-9')[-10..-1]
#     # @number = num[/\A(?:1?\(?)\d{3}(?:\)?[ .-]?)\d{3}(?:[ .-]?)\d{4}\z/] || '0' * 10
#   end

#   def area_code
#     number[0, 3]
#   end

#   def to_s
#     number.sub(/(.{3})(.{3})(.{4})/, '(\1) \2-\3')
#   end
# end


class PhoneNumber
  VALID_NUMBER = /\A1?\(?(\d{3})\)?[ .-]?(\d{3})[ .-]?(\d{4})\z/

  attr_reader :number

  def initialize(num)
    @number = num.match(VALID_NUMBER)&.captures&.join || '0' * 10
  end

  def area_code
    number[0, 3]
  end

  def to_s
    number.sub(/(.{3})(.{3})/, '(\1) \2-')
  end
end
