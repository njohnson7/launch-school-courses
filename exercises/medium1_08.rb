# medium1_08.rb

def convert_to_base_8(n)
  n.to_s(8).to_i          # replace these two method calls
end



# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc) # =>  [10, 12, 14, 16, 20, 41]



# public :convert_to_base_8
# p [8, 10, 12, 14, 16, 33].map(&:convert_to_base_8)





def convert_to_base8(n)
  n.to_s(8).to_i
end

p [8, 10, 12, 14, 16, 33] # ...code...
# =>  [10, 12, 14, 16, 20, 41]

base8 = method(:convert_to_base8).to_proc
p [8, 10, 12, 14, 16, 33].map(&base8)

# OR:
p [8, 10, 12, 14, 16, 33].map(&method(:convert_to_base8))

p base8.arity
