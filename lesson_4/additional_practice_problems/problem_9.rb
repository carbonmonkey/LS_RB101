# As we have seen previously we can use some built-in string methods
# to change the case of a string. A notably missing method is something 
# provided in Rails, but not in Ruby itself...titleize. This method 
# in Ruby on Rails creates a string that has each word capitalized as 
# it would be in a title. For example, the string:

# words = "the flintstones rock"

# would be:

# words = "The Flintstones Rock"

# Write your own version of the rails titleize implementation.

=begin

input: a string
output: the string with each word capitalized

- define a method
- input string is all lowercase
- ouptut is string with first letter of each word uppercase
- returned string is saved as the original varaible

example:
before method: words = "the flintstones rock"
after method: "The Flintsones Rock"

data structures: string, array

algorithm:
- save the input sting as a variable
- split the string into an array of words
- create an empty array for output

- get the first word from the array
- capitalize it
- add it to the return array
- get the next string from the array
- repeat the previous 3 steps until the end of the array is reached

- join the array into a string and return it
=end

# def titleize(sentence)
#   words = sentence.split
#   result = []

#   counter = 0
#   loop do
#     break if counter >= words.size

#     current_word = words.fetch(counter)
#     result.concat [current_word.capitalize]

#     counter += 1
#   end

#   result.join(' ')
# end

def titleize(sentence)
  sentence.split.map(&:capitalize).join(' ')
end

words = "the flintstones rock"

p titleize(words) == "The Flintstones Rock"
