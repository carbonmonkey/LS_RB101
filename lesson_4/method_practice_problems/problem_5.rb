# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift # ==> [:a, 'ant']

# The documentation states that Hash#shift removes the first hash
# entry and returns a 2-element Array containing the removed key 
# and value.

hash # ==> { :b => bear }
