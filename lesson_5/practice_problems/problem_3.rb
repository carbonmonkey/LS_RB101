=begin
Practice Problem 3
For each of these collection objects demonstrate how you would reference the letter 'g'

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

**problem**

- input is a collection of various elements
- output is the string 'g'

**examples**

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]] --> 'g'

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}] --> 'g'

arr3 = [['abc'], ['def'], {third: ['ghi']}] --> 'g'

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']} --> 'g'

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}} --> 'g'

**data structures**

- various collections --> string ('g')

**algorithms**

**arr1**

- select the third element in array (returns sub-array)
- select the second element in the result (returns sub-array)
- select the last elemment in the result (returns 'g')

**arr2**

- select the second element in array (returns hash)
- select the `:third` key from the result (retruns array value)
- select the first value from the result (returns 'g')

**arr3**

- select the third value from the array (returns hash)
- select the `:third` key from the result (retruns array value)
- select the first value from the result (returns string)
- select the first character in the result (returns 'g')

**hsh1**

- select the key 'b' from the hash (returns array)
- select the last value from the array (returns 'g')

**hsh2**

- select the `:third` key from the hash (returns sub-hash)
- select the key for the value `0` (returns 'g')

=end

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1].last == 'g'

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0] == 'g'

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0] == 'g'

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'].last == 'g'

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].key(0) == 'g'
p hsh2[:third].keys.first == 'g'
