# basics_inheritance_08.rb


# Method Lookup (Part 2)

# Using the following code, determine the lookup path used when invoking
# cat1.color. Only list the classes that were checked by Ruby when searching for
# the #color method.

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# Cat, Animal, Object, BasicObject
