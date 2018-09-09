# CLASSES VS. OBJECTS

=begin

- CLASS: basic outline defining what an object should be:
  - made of (state/ivars/attributes)
    - scoped at obj level (access from instance methods)
  - able to do (behaviors/methods)
    - groups behaviors
- OBJECTS: instantiated from classes
  - encapsulate state
- objects of same class:
  - unique states/ivars:
    - which / how many ivars are defined, and ivar values
  - share behaviors:
    - methods of object == instance methods of its class
- define class:
  - class keyword
  - name of class:
    - constant that references class in CamelCase naming convention
  - end keyword
- #initialize == constructor:
  - called/triggered every time a new object is instantiated
  - pass arguments into #initialize through Class#new
- Object#class returns obj's class
- file names: class's name in snake case
-----------------
- a class is:
  - an object (instance of class Class) (subclass of Module)
  - list of instance methods
  - link to a superclass
- code in a class definition is executed immediately, unlike methods
- class def
  - scope gate
  - current class becomes the class
  - class def instantiates a new object of type Class and assigns to a constant
- anonymous class => Class.new
- object/instance = collection of ivars and a reference to a class:
  - an object's ivars live in the object itself
  - an object's methods live in the object's class (instance methods of class)
- all ivars belong to the current object self

=end

# class keyword to define a new class named SmartPhone.
  # constant that references the class we are defining.
# use this constant to access class throughout rest of program.
class SmartPhone
  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  # ivars are scoped at the object level, so they can be accessed from instance methods
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




# invoke Object#class to return a constant that references the class of an obj:
'abc'.class      # ==> String
123.class        # ==> Integer
[1, 2, 3].class  # ==> Array
nexus6.class     # ==> SmartPhone




# 2 ways to define an empty class:
class Nexus6 < SmartPhone; end

IPhone = Class.new(SmartPhone)
