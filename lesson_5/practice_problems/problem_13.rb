=begin
Practice Problem 13

Given the following data structure, return a new array
containing the same sub-arrays as the original but ordered
logically by only taking into consideration the odd numbers
they contain.

**problem**

- input is a nested array
- output is a new nested array with the same sub arrays
  - sub arrays ordered by only taking into account odd integers they contain

**examples**

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

The sorted array should look like this:

[[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

**data structures**

- array --> array

**algorithm**

- create an empty array for the result
**loop**
- get a sub array from the input array
- get the odd integers and place them into a new array
- use the new array to determine the current sub array's position in the result array
- repeat until all sub arrays have been sorted into the result array
**end loop**
- return the result array

=end

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

sorted_arr = arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

p sorted_arr == [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]
