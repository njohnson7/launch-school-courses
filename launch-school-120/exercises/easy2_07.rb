# easy2_07.rb

# Pet Shelter

# Consider the following code:


# class Pet
#   attr_reader :type, :name

#   def initialize(type, name)
#     @type = type
#     @name = name
#   end

#   def to_s
#     "a #{type} named #{name}"
#   end
# end

# class Owner
#   attr_accessor :number_of_pets
#   attr_reader :name

#   def initialize(name)
#     @name = name
#     @number_of_pets = 0
#   end
# end

# class Shelter
#   def initialize
#     @records = Hash.new { |hsh, k| hsh[k] = [] }
#     # @records = {}
#   end

#   def adopt(owner, pet)
#     # @records[owner] << { type: pet.type, name: pet.name }
#     @records[owner] << pet
#     owner.number_of_pets += 1
#   end

#   def print_adoptions
#     @records.each do |owner, pets|
#       # puts pet_list.map { |pet| "a #{pet[:type]} named #{pet[:name]}" }
#       puts "#{owner.name} has adopted the following pets:"
#       # puts pets.map { |pet| "a #{pet.type} named #{pet.name}" }
#       puts pets
#       puts
#     end
#   end
# end





class Pet
  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{@type} named #{@name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  def initialize
    @owners = []
  end

  def adopt(owner, pet)
    @owners << owner unless @owners.include?(owner)
    owner.add(pet)
  end

  def print_adoptions
    @owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      puts owner.pets
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
cat = Pet.new('cat', 'Caaaat')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
njohnson = Owner.new('N Johnson')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(njohnson, cat)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{njohnson.name} has #{njohnson.number_of_pets} adopted pets."

# Write the classes and methods that will be necessary to make this code run,
# and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# The order of the output does not matter, so long as all of the information is
# presented.
