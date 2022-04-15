=begin
Practice Problem 8

Using the each method, write some code to output all of the
vowels from the strings.

hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}

**problem**

- input is a hash
  - keys are symbols
  - values are arrays
- output is all of the vowels from the strings within the arrays
  - output is a string printed
-use the each method

**examples**

- output --> "euiooueoeeao"

**data structures**

- hash --> array --> string

**algorithm**

- create an empty string to collect all of the vowels

**outer loop**
  - get a value from the hash (returns an array)

  **inner loop**
    - get a value from the array (returns a string)
    - remove all characters from the string that are not vowels
    - add the remaining characters in the string to the result string
    - repeat until the end of the array is reached
  **end inner loop**

  - repeat until the end of the hash is reached
**end outer loop**

- print the vowel string

=end

hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}

# vowels = ''

# hsh.each do |_, array|
#   array.each do |string|
#     vowels << string.delete('^aeiou')
#   end
# end

# puts vowels

vowels = 'aeiou'

hsh.each do |_, arr|
  arr.each do |str|
    str.each_char do |chr|
      puts chr if vowels.include? chr
    end
  end
end
