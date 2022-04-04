# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# ==> [1, 2, 3]
# The `select` method's selection criteria is the block's returned value
# at each iteration. The last expression in the block is the string 'hi'.
# This evaluates as "truthy", so every element in the calling array is
# selected and added to the array returned by `select`.
