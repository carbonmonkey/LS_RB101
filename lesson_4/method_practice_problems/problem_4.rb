# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# The block is using element assignment to assign key value pairs
# to the empty hash that was passed as an argument to the method.
# For each key, string element reference is used to reference the
# character at index 0 of the element assigned to the `value` parameter
# of the block. For each value, `value` is referenced. After the last
# iteration, the array is returned.
# ==> {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
