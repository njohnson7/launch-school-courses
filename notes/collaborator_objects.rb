# COLLABORATOR OBJECTS

=begin

- any object can be used to represent an object's state
  - ivars can be set to any object, even an object of a custom class
- working w/ collaborator objects is no different than working with core class objects
  - ex: strings, integers, arrays, hashes
- when modeling complex problem domains, using collaborator objects is at the core of OOP, allowing you to split up and modularize the problem domain into cohesive pieces.

=end

class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
# bud = Bulldog.new           # ~> NameError: uninitialized constant Bulldog
# assume Bulldog class from previous assignment

# bob.pet = bud  # ~> NameError: undefined local variable or method `bud' for main:Object

# Because bob.pet returns a Bulldog object, we can then chain any Bulldog methods at the end as well:

# bob.pet.speak
# bob.pet.fetch

class SmartPhone
  attr_reader :camera

  def initialize(camera)
    @camera = camera
  end
end

class Camera
  def take_photo
    'Taking photo...'
  end

  def record_video
    'Recording video...'
  end
end

camera = Camera.new
nexus6 = SmartPhone.new(camera)

# b/c #camera returns a Camera object, we can chain any Camera instance methods onto camera
nexus6.camera.take_photo         # ==> "Taking photo..."
nexus6.camera.record_video       # ==> "Recording video..."



class SmartPhone
  attr_reader :apps

  def initialize(model)
    @model = model  # Strings are also a collaborator object
    @apps = []
  end

  def install_app(app)
    apps << app
  end
end

class App
  def initialize(name)
    @name = name
  end

  def open
    "Opening #{@name}..."
  end
end

nexus6 = SmartPhone.new('Nexus 6')
sound_cloud = App.new('SoundCloud')
chrome = App.new('Chrome')
nexus6.install_app(sound_cloud)
nexus6.install_app(chrome)
nexus6.apps     # ==> [#<App:0x000000017bd7b0 @name="SoundCloud">,
                       #<App:0x000000017bcea0 @name="Chrome">]
nexus6.apps.each { |app| puts app.open }
# <= Opening SoundCloud...
# <= Opening Chrome...



nexus6.apps.first.open  # ==> "Opening SoundCloud..."
