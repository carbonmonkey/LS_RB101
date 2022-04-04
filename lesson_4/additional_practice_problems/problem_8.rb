# What happens when we modify an array while we are iterating over it? What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# ==> 1, 3

# What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# ==> 1, 2

numbers = [1, 2, 3, 4]
counter = 0

loop do
  break if counter >= numbers.length

  number = numbers[counter]
  p number
  numbers.pop(1)

  counter += 1
end

# ==> 1, 2
