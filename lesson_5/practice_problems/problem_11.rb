=begin
Practice Problem 11

Given the following data structure use a combination of methods,
including either the select or reject method, to return a new
array identical in structure to the original but containing only
the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

**problem**

- input is a nested array
  - sub-arrays are of differing sizes
  - sub-arrays contain only integers
- output is a new nested array
  - identical in structure to input array
  - contains only integers that are multiples of 3

**examples**

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
==> [[], [3], [9], [15]]

**data structures**

- array --> array

**algorithm**

- create an empty array for the result
**loop**
  - get a sub-array from the array
  - create a new array from the sub array
    - with only the integers evenly divisible by 3
  - add the new array to the result array
  - repeat until the end of the input array is reached
**end loop
- return the result array

=end

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |sub_arr|
  sub_arr.select { |num| num % 3 == 0 }
end

p arr
p new_arr
