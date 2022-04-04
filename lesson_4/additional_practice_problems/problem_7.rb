# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

=begin

input: a string
output: a hash that shows the frequency of each letter

- letters are string keys and integers are values in hash
- hash is case sensitive
- values in hash represent frequency of each character in input string

example: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

data structures: string, array, hash

algorithm:
- create an empty hash
- split the string into an array of characters
- loop through each letter in the array
  - if the letter is a key in the hash
    - add 1 the the corrisponding value
  - otherwise
    - assign the letter as a key in the hash with a value of 1
- reference the value of the hash

=end

# letters = statement.chars
# letter_frenquency = {}
# counter = 0

# loop do
#   break if counter == letters.size

#   current_letter = letters.fetch(counter)

#   if letter_frenquency.key?(current_letter)
#     letter_frenquency[current_letter] += 1

#   else
#     letter_frenquency[current_letter] = 1

#   end
#   counter += 1
  
# end

# p letter_frenquency

letters_hash = Hash.new(0)

# statement.chars.each do |char|
#   letters_hash[char] += 1 if char != ' '
# end

# p letters_hash

# statement.delete('^A-z').each_char do |char|
#   letters_hash[char] += 1
# end

# p  letters_hash

letters_array = ('A'..'z').to_a
letters_array.each do |letter|
  count = statement.count(letter)
  letters_hash[letter] = count if count > 0
end

p letters_hash
