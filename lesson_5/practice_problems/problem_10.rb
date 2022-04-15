=begin
Practice Problem 10

Given the following data structure and without modifying the
original array, use the map method to return a new array
identical in structure to the original but where the value of
each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

**problem**

- input is an array of hashes
- output is a new array
  - same structure as original array
  - value of each integer incremented by 1
- integers are the values of sub-hashes
- use map

**examples**

- output --> [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

**data structures**

- array of hashes --> array of hashes

**algorithm**

**outer loop**(map)
  - get an element from input array (returns hash)
  - convert the hash onto a nested array
  **inner loop**(map)
    - get an array from the nested array
    - increment the second value by 1
    - return the array with the new value
    - repeat until the end of the nested is reached
  **end inner loop**
  - convert the array into a hash
  - return the new hash
  - repeat until the end of the input array is reached
**end outer loop**

--OR--

- create an empty array for the result
**outer loop**
  - get a hash from the input array
  - create a temp hash for new values
  **inner loop**
    - get a key-value pair from the hash
    - increment the value by 1
    - add the key-value pair to the temp hash
    - repeat until the end of the hash is reached
  **end inner loop**
  - add the temp hash to the result array
  - repeat until the end of the input array is reached
**end outer loop**
- return the result array

=end

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hash|
  temp_hash = {}
  hash.each do |key, value|
    value += 1
    temp_hash[key] = value
  end
  temp_hash
end

# new_arr = arr.map do |hash|
#   hash.to_a.map do |array|
#     array[1] += 1
#     array
#   end.to_h
# end

p arr
p new_arr
