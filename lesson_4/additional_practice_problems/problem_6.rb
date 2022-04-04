# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

=begin

input: an array of names
output: the array with names shortened to the first three characters

example output:
['Fre', 'Bar', 'Wil', 'Bet', 'Bam', 'Peb']

data structure: array

algorithm:

- create an empty array for the shortened names
- set a counter to 0
- loop through the array
  - get a name from the array
  - set it as the current name
  - select the first 3 characters and add it to the output array
  - increment the counter by 1
  - exit the loop after the last name in the array is reached

=end

# short_stones = []
# counter = 0
# loop do
#   break if counter >= flintstones.size

#   current_name = flintstones.fetch(counter)
#   short_stones.push(current_name.slice(0, 3))

#   counter += 1
# end

# p short_stones

flintstones.map! { |name| name[0...3] }
p flintstones
