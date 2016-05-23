# medium1_6.rb
# Alyssa was asked to write an implementation of a rolling buffer. Elements are
# added to the rolling buffer and if the buffer becomes full, then new elements
# that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for
# modifying the buffer?". Is there a difference between the two, other than what
# operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end


# The difference between using << in the first method and using + in the second
# method is that the first method will mutate the caller, buffer. The original
# variable called buffer that is passed into the method as an argument will be
# permanently altered by the method, as well as being returned by the method.

# The second method, using +, will return the same result as the first method,
# however, since it uses reassignment instead of the shovel operator, to add
# elements to the array, it will leave the original input_array passed in to the
# method unmodified.
