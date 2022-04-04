# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# The documentation states that when Array#count is givin a block, it
# returns the count of elements for which the block returns a truthy
# value.
# ==> 2
