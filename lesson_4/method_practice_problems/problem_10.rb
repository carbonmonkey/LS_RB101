# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# If the element is greater than 1, the `puts` statement is executed,
# returning nil. Otherwise, the else statement is executed, which
# returns the current element. Map returns a new array with the return
# values of its block for each element in the calling collection.

# => [1, nil, nil]
