# What is the block's return value in the following code? 
# How is it determined? Also, what is the return value of any? 
# in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# The block returns true, false, true
# any? returns true
# outputs: 1
# any? only iterates one time because the block returns true on the
# first iteration.
