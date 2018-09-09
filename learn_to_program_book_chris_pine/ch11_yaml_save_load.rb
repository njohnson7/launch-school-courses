# ch11_yaml_save_load.rb
# saving and loading objects w/ just 1 method call



require 'yaml'

# first we define these fancy methods...
def yaml_save object, filename
  File.open filename, 'w' do |f|
    f.write(object.to_yaml)
  end
end

def yaml_load filename
  yaml_string = File.read filename
  YAML::load yaml_string
end

# and now we use these methods:
test_array = ['Slick Shoes', 'Bully Blinders', 'Pinchers of Peril']
filename = 'DatasGadgets.txt'
yaml_save test_array, filename        # saves
read_array = yaml_load filename       # loads

puts(read_array == test_array)