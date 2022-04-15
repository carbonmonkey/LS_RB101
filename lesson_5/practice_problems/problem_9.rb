=begin
Practice Problem 9

Given this data structure, return a new array of the same
structure but with the sub arrays being ordered
(alphabetically or numerically as appropriate) in descending
order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

**problem**

- input is a nested array
  - sub-arrays include either strings or integers
- output is a new array
  - same nested structure
  - sub-arrays elements in descending order

**examples**

- output --> [['c', 'b', 'a'], [3, 2, 1], ['green', 'blue', 'black']]

**data structures**

- nested array --> nested array

**algorithm**

- get a value from the array (returns array)
- sort the array in descending order
- repeat until the end of the input array is reached
- return the ordered sub-arrays in a new array

=end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

ordered_arr = arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end

p ordered_arr == [['c', 'b', 'a'], [3, 2, 1], ['green', 'blue', 'black']]
