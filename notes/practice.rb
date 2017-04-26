# class SmartPhone
#   def initialize(brand, model)
#     @brand = brand
#     @model = model
#   end
# end

# nexus6 = SmartPhone.new('Motorola', 'Nexus 6')
# p nexus6
# # ==> #<SmartPhone:0x00000002520ba0 @brand="Motorola", @model="Nexus 6">

# class SmartPhone
#   def model
#     @model
#   end
# end

# p nexus6.model  # ==> "Nexus 6"

# nexus6.model.upcase  # ==> "NEXUS 6"
# nexus6.model  # ==> "Nexus 6"
# nexus6.model.upcase!
# nexus6.model          # ==> "NEXUS 6"


# class SmartPhone
#   def model=(value)
#     @model = value
#   end

#   def color=(c)
#     @color = c
#   end

#   def color
#     @color
#   end
# end

# nexus6.model = 'Nexus 5'
# p nexus6.model            # ==> "Nexus 5"
# nexus6.model=('Nexus 4')
# p nexus6.model            # ==> "Nexus 4"

# p nexus6.color  # ==> nil
# p nexus6.color = 'blue'
# p nexus6.color           # ==> "blue"

# pixel = SmartPhone.new('Google', 'Pixel')
# p nexus6
# # ==> #<SmartPhone:0x0000000255ab20 @brand="Motorola", @model="Nexus 4", @color="blue">
# p pixel
# # ==> #<SmartPhone:0x00000002549898 @brand="Google", @model="Pixel">
# p pixel.color = 'white'
# p pixel
# # ==> #<SmartPhone:0x00000001284438 @brand="Google", @model="Pixel", @color="white">

# pixel.color   # ==> "white"
# nexus6.color  # ==> "blue"

# class SmartPhone
#   def brand
#     @brand
#   end

#   def brand=(b)
#     @brand = b
#   end
# end

# class SmartPhone
#   attr_reader :brand, :model, :color
# end

# nexus6.brand  # ==> "Motorola"
# nexus6.model  # ==> "Nexus 4"
# nexus6.color  # ==> "blue"

# class SmartPhone
#   attr_writer :brand, :model, :color, :screen_size
# end

# nexus6.brand = 'Google'
# nexus6.brand             # ==> "Google"

# nexus6.screen_size = '6 inches'

# class SmartPhone
#   attr_accessor :brand, :model, :color, :screen_size
# end

# nexus6.screen_size        # ==> "6 inches"
# nexus6.model = 'Nexus 6'
# nexus6.model              # ==> "Nexus 6"


# class SmartPhone
#   def change_brand_and_model(b, m)
#     # brand = b
#     # model = m
#     self.brand = b
#     self.model = m
#   end

#   def to_s
#     "#{self.class} info -- brand: #{@brand}, model: #{self.model}"
#     "#{self.class} info -- brand: #{@brand}, model: #{model}"
#     # self.class.name
#   end

#   def send(text_msg)
#     "Sending #{text_msg}"
#   end
# end

# # nexus6.to_s  # ==> "#<SmartPhone:0x0000000222fba8>"
# # puts nexus6
# # p nexus6
# # "to_s: #{nexus6}"  # ==> "to_s: #<SmartPhone:0x00000000dcf320>"

# # puts nexus6
# # "#{nexus6}"  # ==> "SmartPhone info -- brand: Google, model: Nexus 6"
# # nexus6.to_s  # ==> "SmartPhone info -- brand: Google, model: Nexus 6"

# # # nexus6.send('hello')  # => "Sending hello"
# # # nexus6.send(:brand=, 'Motorola')  # ~~> ArgumentError: wrong number of arguments (given 2, expected 1)
# # # nexus6.send(:brand)


# # puts nexus6
# # "#{nexus6}"
# # nexus6.to_s



# nexus6.change_brand_and_model('HTC', 'One')
# nexus6.to_s
# # ==> "SmartPhone info -- brand: HTC, model: One"
"GET /?number=-1 HTTP/1.1"  # => "GET /?number=-1 HTTP/1.1"

/[a-z0-9]+=[\W\w\d]+\s/  # => /[a-z0-9]+=[\W\w\d]+\s/


"name=123a"       # => "name=123a"
"123=asd"         # => "123=asd"
"name123=123aaa"  # => "name123=123aaa"
"name123=-10+15"  # => "name123=-10+15"


"GET /?number=-1 HTTP/1.1".match(/(?<=\?).+(?= )/)  # => #<MatchData "number=-1">