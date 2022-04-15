=begin
Practice Problem 14

Given this data structure write some code to return an array
containing the colors of the fruits and the sizes of the
vegetables. The sizes should be uppercase and the colors
should be capitalized.

**problem**

- input is a hash of hashes
  - colors and sizes are within sub hashes
  - sizes are strings
  - colors are strings within an array
- output is an array
  - contains the colors of fruits and sizes of vegitables
  - the colors are in sub arrays
  - the colors and sizes are strings
  - sizes are uppercase
  - colors are capitalized

  **examples**

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

The return value should look like this:

[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]


**data structures**

- nested hash --> array

**algorithm**

- create an empty array for the result
**loop**
  - get a value from the input hash (returns sub hash)
  - if the type is fruit
    - get the array value for the `:colors` key
    - capitalize the elements in the array
    - add the array to the result array
  - if the type is vegitalble
    - reference the `:size` key to get its string value
    - change the string to all uppercase
    - add it to the result array
  - repeat until the end of the input hash is reached
**end loop**
return the result array
=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# result = []
# hsh.each_value do |sub_hash|
#   if sub_hash[:type] == 'fruit'
#     result << sub_hash[:colors].map(&:capitalize)
#   else
#     result << sub_hash[:size].upcase
#   end
# end

result = hsh.map do |_, sub_hash|
  if sub_hash[:type] == 'fruit'
    sub_hash[:colors].map(&:capitalize)
  else
    sub_hash[:size].upcase
  end
end

p result == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
