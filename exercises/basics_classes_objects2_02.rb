# basics_classes_objects2_02.rb


# Hello, Chloe!

# Using the following code, add an instance method named #rename that renames
# kitty when invoked.

# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.name
# kitty.rename('Chloe')
# kitty.name

# Expected output:

# Sophie
# Chloe



class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(n)
    self.name = n
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name
