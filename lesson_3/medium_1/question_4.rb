def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# The use of the shovel '<<' mutates the 'buffer' array by adding an element.
# The input argument assigned to 'buffer' will be mutated

# The use of '+' returns a new array containing the elements of both arrays.
# The input argument assigned to 'input_array' will not be modified.
