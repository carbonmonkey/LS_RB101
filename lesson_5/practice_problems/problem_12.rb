=begin
Practice Problem 12

Given the following data structure, and without using the
Array#to_h method, write some code that will return a hash
where the key is the first item in each sub array and the
value is the second item.

**problem**

- input is a nested array
  - each nested array has two elements
- output is a hash
  - key is first element in each sub array
  - value is the second element
- don't use to_h

**examples**

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
==> {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"

**data structures**

- nested array --> hash

**algorithm**

1. create an empty hash for the result
2. iterate through the input array
  a.) get the sub array
  b.) add the first element and second element as a key-value pair
      to the result hash
3. return the result hash

=end

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# hsh = arr.each_with_object({}) do |sub_arr, hash|
#   hash[sub_arr[0]] = sub_arr[1]
# end

hsh = arr.inject({}) do |hash, sub_arr|
  hash[sub_arr[0]] = sub_arr.last
  hash
end

p hsh
