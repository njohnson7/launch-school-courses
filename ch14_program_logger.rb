# ch14_program_logger.rb



def log(block_description, &block)
  puts "Beginning #{block_description}..."
  returned = block[]
  puts "'#{block_description}' has finished running, returning:\n#{returned}"
end

# outer_block = Proc.new {"OUTER BLOCK"}
# inner_block = Proc.new {"INNER BLOCK"}
# another_block = Proc.new {"ANOTHER BLOCK"}

log("Outer Block") { "OUTER! #{log("Inner Block") { "INNER! #{log("Another Block") {"ANOTHER!"}}" }}" }
puts


# BOOK SOLUTION:

log('outer block') do
  log('some little block') { 1**1 + 2**2 }
  log('yet another block') { '!doof iahT ekil I'.reverse }
  '0' == 0
end