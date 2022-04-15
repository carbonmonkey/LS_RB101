=begin
Practice Problem 4

For each of these collection objects where the value 3 occurs,
demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

**problem**

- inputs are collections containing various data-types as elements
- output is each collection with and value of 3 changed to 4

**examples**

arr1 = [1, [2, 3], 4] --> [1, [2, 4], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3] --> [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 4]

hsh1 = {first: [1, 2, [3]]} --> {first: [1, 2, [4]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5} --> {['a'] => {a: ['1', :two, 4], b: 4}, 'b' => 5}

**data structures** 

orgininal data structure

**algorithm**

**arr1**

- get the second element in the array (returns sub-array)
- change the value of the second element in the sub-array to 4

**arr2**

- get the last element in the array
- change the value to 4

**hsh1**

- reference the `:first` key of hash (returns array)
- get the last element in the array (returns sub-array)
- change the value of the element in the array to 4

**hsh2**

- reference the key `['a']` of the hash (returns sub-hash)
- reference the key `:a` of the sub-hash (returns array)
- change the value of the last element of the array to 4


=end

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1 == [1, [2, 4], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4
p arr2 == [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 4]

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][-1][0] = 4
p hsh1 == {first: [1, 2, [4]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][-1] = 4
p hsh2 == {['a'] => {a: ['1', :two, 4], b: 4}, 'b' => 5}
