# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

=begin

input: hash with names and ages
output: sum of all ages

- hash has strings as keys and integers as values
- return an integer

expected output: 6174

data structure: hash

algorithm:

- create a total and set it to 0
- get the first value from the hash
- add it to the total
- repeat previous two steps until end of hash

=end

# names = ages.keys
# counter = 0
# total = 0

# loop do
#   break if counter >= names.size

#   current_name = names.fetch(counter)
#   total += ages[current_name]

#   counter += 1
# end

# ages.each { |_, v| total += v }

# p total

p ages.values.sum
