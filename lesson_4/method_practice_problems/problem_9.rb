# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# The if expression returns nil for the first value, and 'bear' for
# the second value. Enumerable#map returns an array with the returned
# values if its block from each iteration.
# => [nil, 'bear']
