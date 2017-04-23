# CLASSES VS. OBJECTS

=begin

- Classes are like a basic outline, or blueprint, that defines:
  - what an object should be made of (its state/ivars/attributes)
    - objects encapsulate state
  - what an object should be able to do (behaviors/methods)
    - classes group behaviors
- Objects are instantiated (or created) from classes
- Different objects of the same class:
  - unique states/ivars
    - can differ both in which / how many ivars are defined, and their values
  - share the same behaviors
    - methods of the object are the instance methods of its class
- Calling Object#class on an object returns the name of its class
- Define a class by:
  - class keyword
  - name of class (constant in CamelCase naming convention)
  - end keyword finishes the definition
- Ruby file names should be in snake_case and reflect the class name

- #initialize:
  - called a constructor
    - b/c it gets called/triggered every time a new object is instantiated
  - you pass arguments into initialize through Class#new


- Classes are objects too, instances of the class Class

=end




# We use the class keyword to define a new class named SmartPhone.
# SmartPhone is a constant that references the class we are defining.
# We can use this constant to access this class throughout the rest of our program.
class SmartPhone
  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  def open_app(app_name)
    puts "#{app_name} has been opened on your #{@model}."
  end
end


nexus6 = SmartPhone.new('Motorola', 'Nexus 6')
nexus6.open_app('SoundCloud')




class SmartPhone
  def add_contact(name)
    @contacts ||= []
    @contacts << name
  end
end

# instance variables are unique to each object:
nexus6 = SmartPhone.new('Motorola', 'Nexus 6')
nexus6      # ==> #<SmartPhone:0x0000000234b208 @brand="Motorola", @model="Nexus 6">

galaxy_s8 = SmartPhone.new('Samsung', 'Galaxy S8')
galaxy_s8.add_contact('Fred')
galaxy_s8   # ==> #<SmartPhone:0x0000000234a9c0 @brand="Samsung",
            #     @model="Galaxy S8",  @contacts=["Fred"]>