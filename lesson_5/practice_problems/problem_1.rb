=begin
Practice Problem 1
How would you order this array of number strings by descending
numeric value?

arr = ['10', '11', '9', '7', '8']

**problem**
- input is an array of number strings
- output is an array ordered by descending numeric value
  - contains same string values as input array

**examples**
['10', '11', '9', '7', '8'] --> ['11', '10', '9', '8', '7']

**data structures**
- arrays

**algorithm**
- get a value from the input array
- convert the value to integer
- sort it by comparing it to other values in array converted to integer
  - in descending order
- return the sorted array with original string values
=end

arr = ['10', '11', '9', '7', '8']

# sorted_arr = arr.sort_by { |num| -(num.to_i) }
# p sorted_arr

p arr.sort { |num1, num2| num2.to_i <=> num1.to_i }
