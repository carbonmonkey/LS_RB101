# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# The documentation states that Array#reject returns a new Array 
# whose elements are all those from self for which the block returns
# false or nil. The `puts` expression is the last expression in the
# block, and returns nil. Thus, the returned array will contain all
# of the elements from the calling array.
# ==> [1, 2, 3]
