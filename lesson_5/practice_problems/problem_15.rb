=begin
Practice Problem 15

Given this data structure write some code to return an array
which contains only the hashes where all the integers are
even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

**problem**

- input is an array of hashes
  - each hash has array values
  - each array has integer values
- an array which contains only the hashes from the input array with all
    even integers

**examples**

- output --> [{e: [8], f: [6, 10]}]

**data strucures**

- array of hashes --> array of hashes

**algorithm**

- create an empty array for the result

**outer loop**
- get a hash from the input array
  **inner loop**
  - get a value from the hash (returns an array)
    **innermost loop**
    - get an integer from the array
    - check to see if it is even
    - repeat until the end of the array is reached
    **end innermost loop**
  - repeat until the end of the hash is reached
  **end inner loop**
- if all the integers within arrays within the hash are even:
    - add the hash to the result array
- repeat until the end of the input array is reached
**end loop*

- return the result array

=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

evens_arr = arr.select do |hash|
  hash.all? { |_, array| array.all?(&:even?) }
end

p evens_arr
