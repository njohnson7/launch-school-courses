# STATES VS. BEHAVIOR

=begin

- states track attributes for individual objects: ivars
  - unique to every object (even instances of the same class)
    - (which ones / how many are defined, and values)
  - scoped at the object (instance) level
    - exist for as long as the object instance exists
  - ivars are one way of tying data to objects
  - syntax:  @ character, snake_case
- behaviors are what objects are capable of doing: methods
  - shared b/w all objects/instances of the same class
  - methods of an object are the instance methods defined in its class
  - instance methods expose behavior for objects

=end

class SmartPhone
  def initialize(brand, model)
    @brand = brand              # => "Motorola", "Google"
    @model = model              # => "Nexus 6",  "Pixel"
  end                           # => :initialize

  # we can expose information about the state of an object using instance methods:
  def open_app(app_name)
    "#{app_name} has been opened on your #{@model}."  # => "SoundCloud has been opened on your Nexus 6.", "SoundCloud has been opened on your Pixel."
  end                                                 # => :open_app

  def add_contact(name)
    @contacts ||= []     # => []
    @contacts << name    # => ["Fred"]
  end                    # => :add_contact
end                      # => :add_contact

nexus6 = SmartPhone.new('Motorola', 'Nexus 6')  # => #<SmartPhone:0x00000001a44948 @brand="Motorola", @model="Nexus 6">
pixel = SmartPhone.new('Google', 'Pixel')       # => #<SmartPhone:0x00000001a2bd08 @brand="Google", @model="Pixel">

# all objects of the same class share the same behaviors, although they contain different states.
# they both open an app in the same way, but they have their own unique @model:
nexus6.open_app('SoundCloud')  # ==> "SoundCloud has been opened on your Nexus 6."
pixel.open_app('SoundCloud')   # ==> "SoundCloud has been opened on your Pixel."



# the values of instance variables are unique to each object:
nexus6  # => #<SmartPhone:0x00000001a44948 @brand="Motorola", @model="Nexus 6">
# ==> #<SmartPhone:0x0000000234b208 @brand="Motorola", @model="Nexus 6">
pixel   # => #<SmartPhone:0x00000001a2bd08 @brand="Google", @model="Pixel">
# ==> #<SmartPhone:0x0000000222a6f8 @brand="Google", @model="Pixel">

# ivars are not initialized until the instance method in which they are defined in is invoked:
pixel.add_contact('Fred')  # => ["Fred"]
# so ivars can also be unique in regards to how many and which ones are defined:
pixel   # ==> #<SmartPhone:0x0000000234a9c0
        #     @brand="Samsung", @model="Galaxy S8",  @contacts=["Fred"]>