# ch14_better_program_logger.rb


$nesting_depth = 0

def log(block_description, &block)
  indent = "  " * $nesting_depth
  puts "#{indent}Beginning #{block_description.inspect}..."
  $nesting_depth += 1
  returned = block[]
  $nesting_depth -= 1
  puts "#{indent}...#{block_description.inspect} has finished running, returning:\n#{indent}#{returned}"
end

log('outer block') do
  log('some little block') do
    log('teeny-tiny block') do
      (1..6).to_a.shuffle
    end
    3 * 2 * 7
  end
  log('yet another block') do
    '!doof esenihC ekil I'.reverse
  end
  0 == 0
end